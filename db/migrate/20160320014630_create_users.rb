class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :provider
      t.string :email
      t.string :password
      t.string :access_token
      t.string :access_secret
    end
  end
end
