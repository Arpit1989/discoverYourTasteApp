class CreatePlayedMusics < ActiveRecord::Migration
  def change
    create_table :played_musics do |t|
      t.string :artist
      t.string :song_name
      t.string :song_api
      t.string :genre
      t.string :slug
      t.boolean :love
      t.boolean :not_kind
      t.boolean :like
      t.boolean :hate
      t.timestamps null: false
    end
    add_index :played_musics, :slug, unique: true
  end
end
