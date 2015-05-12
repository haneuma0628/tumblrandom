class AddColumnUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :integer
    add_column :users, :accessToken, :string
    add_column :users, :accessSecret, :string
  end
end
