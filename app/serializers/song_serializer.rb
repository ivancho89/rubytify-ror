class SongSerializer < ActiveModel::Serializer
    attributes :id, :name, :explicit, :duration_ms, :preview_url, :spotify_url
  end