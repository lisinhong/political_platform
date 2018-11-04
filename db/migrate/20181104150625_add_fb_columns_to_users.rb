class AddFbColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :facebook, :string
    add_column :users, :remote_avatar_url, :string
  end
end
