class AddOptionsToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :love_it, :boolean
    add_column :musics, :not_my_kind,:boolean
    add_column :musics, :like_it,:boolean
    add_column :musics, :horrible,:boolean

  end
end
