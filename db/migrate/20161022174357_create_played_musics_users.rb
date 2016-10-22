class CreatePlayedMusicsUsers < ActiveRecord::Migration
  def change
    create_table :played_musics_users, id: false do |t|
      t.belongs_to :played_music
      t.belongs_to :user
    end
  end
end
