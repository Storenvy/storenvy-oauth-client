class AddUserDataToUser < ActiveRecord::Migration
  def change
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :twitter, :string
    add_column :users, :facebook, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
  end
end
