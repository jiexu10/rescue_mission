class User < ActiveRecord::Base
  has_many :questions
  has_many :answers


  def self.from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

      find_or_create_by(provider: provider, uid: uid) do |user|
        user.provider = provider
        user.uid = uid
        # user.email = auth.info.email
        user.name = auth.info.name
        # user.avatar_url = auth.info.image
      end
  end
end






# where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#   user.provider = auth.provider
#   user.uid      = auth.uid
#   user.name     = auth.info.name
#   user.save
# end
