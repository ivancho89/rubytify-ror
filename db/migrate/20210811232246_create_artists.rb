class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :image
      t.integer :popularity
      t.string :genres
      t.string :spotify_url
      t.string :spotify_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
