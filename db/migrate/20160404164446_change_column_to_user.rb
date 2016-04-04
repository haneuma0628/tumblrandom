class ChangeColumnToUser < ActiveRecord::Migration
  def change
    remove_index :users, :email
    add_column :users, :user_id, :string
    add_index :users, :user_id
  end
end
