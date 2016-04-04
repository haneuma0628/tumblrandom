class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid
  validates_uniqueness_of :uid

  def self.find_for_oauth(auth)
    identity = find_by(uid: auth.uid)
    identity = create(uid: auth.uid) if identity.nil?

    identity.access_token  = auth.credentials.token
    identity.access_secret = auth.credentials.secret
    identity.name          = auth.info.name
    identity.email         = auth.info.email
    identity.nickname      = auth.info.nickname

    identity.save
    identity
  end
end
