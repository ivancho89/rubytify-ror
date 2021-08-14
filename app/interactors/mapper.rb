module Mapper
    extend ActiveSupport::Concern
  
    included do
      ## Setters methods
      def artist_map(artist)
        {
          name: artist.name,
          image: artist.images.first['url'],
          genres: artist.genres,
          popularity: artist.popularity,
          spotify_url: artist.href,
          spotify_id: artist.id
        }
      end
    end
  
    def albums_map(albums, artist_id)
      params = []
  
      albums.each do |album|

        album_image = album.images.length > 0 ? album.images[0]['url'] : ''

        params.push(artist_id:artist_id, name: album.name, total_tracks: album.total_tracks,
                              image: album_image, spotify_id: album.id,
                              spotify_url: album.href, tracks: album.tracks)
      end
      
      params
    end
  
    def songs_map(songs, artis_id, album_id)
        params = []
        songs.each do |song|
            params.push(album_id:album_id, name: song.name, preview_url: song.preview_url,
                             duration_ms: song.duration_ms, spotify_id: song.id,
                             spotify_url: song.href, explicit: song.explicit)
      end
  
      params
    end
  end