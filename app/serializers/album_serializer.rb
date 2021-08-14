class AlbumSerializer < ActiveModel::Serializer
    attributes :id, :name, :total_tracks, :spotify_url, :spotify_id
  end