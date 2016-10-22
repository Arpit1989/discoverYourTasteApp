class User < ActiveRecord::Base
  has_and_belongs_to_many :played_musics

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.birthday = auth.extra.raw_info.birthday
      user.email = auth.extra.raw_info.email
      user.location = auth.info.location
      user.image = auth.info.image
      user.verified = auth.info.verified
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
