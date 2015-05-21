class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :avater_file_name, :string
  end
end
