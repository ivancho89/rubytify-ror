class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.bigint :artist_id
      t.string :name
      t.string :image
      t.integer :spotify_id
      t.string :spotify_url
      t.integer :total_tracks
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
