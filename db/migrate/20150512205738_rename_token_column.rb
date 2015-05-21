class RenameTokenColumn < ActiveRecord::Migration
  def change
    rename_column :users, :accessToken, :access_token
    rename_column :users, :accessSecret, :access_secret
  end
end
