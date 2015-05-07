class User < ActiveRecord::Base
  devise :database_authenticatable,
  :omniauthable
  :registerable,
  :rememberable,
  :trackable,
  :validatable,
  # attr_accessible :name, :accessToken, :accessSecret
end
