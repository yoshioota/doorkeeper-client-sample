class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise \
      :database_authenticatable,
      :registerable,
      :recoverable,
      :rememberable,
      :trackable,
      :validatable,
      :omniauthable

  has_many :user_oauths

  def update_oauth(oauth_data)
    user_oauth = self.user_oauths.where(provider: oauth_data['provider'], uid: oauth_data['uid']).first_or_initialize
    user_oauth.params = JSON.generate(oauth_data)
    user_oauth.save!
    self
  end

  def doorkeeper_oauth
    self.user_oauths.where(provider: 'doorkeeper').first
  end
end
