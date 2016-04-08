class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, index: true
      t.string :access_token
      t.string :access_secret
      t.string :uid
      t.string :name
      t.string :email

      t.timestamps null: false
    end
    add_foreign_key :identities, :users
  end
end
