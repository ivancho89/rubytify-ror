class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.bigint :album_id
      t.string :name
      t.string :preview_url
      t.integer :spotify_id
      t.string :spotify_url
      t.integer :duration_ms
      t.boolean :explicit
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
