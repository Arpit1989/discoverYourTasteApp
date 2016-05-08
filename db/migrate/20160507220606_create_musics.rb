class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :artist
      t.string :song_name
      t.string :song_api
      t.string :genre
      t.string :slug

      t.timestamps null: false
    end
    add_index :musics, :slug, unique: true
  end
end
