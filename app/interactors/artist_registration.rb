# frozen_string_literal: true

class ArtistRegistration < MainInteractor
  include Mapper

  def call    
    spotiy_api

    insert_record(model: artist, resource: :artist, params: artist_map(@spotify_res))

    set_albums

  end

  def set_albums
    mapped_albums = albums_map(albums)
    mapped_albums.each do |album|
      @artist.albums.build(album.except(:tracks))
      mapped_songs = songs_map(album[:tracks])
      mapped_songs.each do  |song|
        @artist.albums.last.songs.build(song)
      end
    end
  end

  #Create empty base artist
  def artist
    @artist ||= Artist.new
  end

  def spotiy_api
    @spotify_res ||= RSpotify::Artist.search(context.artist_name).first
  end

  #Simple validation to avoid duplicates
  def albums
    @albums ||= @spotify_res.albums.uniq(&:name)
  end
end