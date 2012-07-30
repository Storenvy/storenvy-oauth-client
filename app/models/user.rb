class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutabl
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # devise :omniauthable
  
  def self.find_or_initialize_for_storenvy_oauth(oauth_data)    
    User.find_or_initialize_by_storenvy_uid(oauth_data.uid).tap do |user|
      user.email    = oauth_data.info.email
      user.login    = oauth_data.info.login
      user.bio      = oauth_data.info.bio
      user.location = oauth_data.info.location
      user.gender   = oauth_data.info.gender
      user.twitter  = oauth_data.info.twitter
      user.facebook = oauth_data.info.facebook
      user.birthday = oauth_data.info.birthday
      user.password = Devise.friendly_token[0,20] if user.new_record?
    end
  end

  def update_storenvy_credentials(oauth_data)
    self.storenvy_access_token = oauth_data.credentials.token
  end
  
end
