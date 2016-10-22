class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :time_zone, :string
    add_column :users, :gender, :string
    add_column :users, :verified, :boolean
    add_column :users, :image, :string
  end
end
