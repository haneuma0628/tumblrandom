class RemoveAvatarFileNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avater_file_name, :string
  end
end
