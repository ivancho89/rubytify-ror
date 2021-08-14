# frozen_string_literal: true

class ArtistRegistration < MainInteractor
  include Mapper

  def call    
    spotiy_api

    @artist_record = insert_record(model: Artist.new, resource: :artist, params: artist_map(@spotify_res))

    set_albums

  end

  def set_albums
    mapped_albums = albums_map(filter_albums, @artist_record.id)
    mapped_albums.each do |album|      

      @album_record = insert_record(model: Album.new, resource: :album, params: album.except(:tracks))

      if @album_record != nil
        mapped_songs = songs_map(album[:tracks], @artist_record.id, @album_record.id)
        mapped_songs.each do  |song|
          @song_record = insert_record(model: Song.new, resource: :song, params: song)

        end
      end
    end
  end

  def spotiy_api
    @spotify_res ||= RSpotify::Artist.search(context.artist_name).first
  end

  #Simple validation to avoid duplicates
  def filter_albums
    @albums ||= @spotify_res.albums.uniq(&:name)
  end
end