class UserOauth < ActiveRecord::Base

  belongs_to :user

  def token
    @token ||= self.params_hash['credentials']['token']
  end

  def params_hash
    @params_hash ||= JSON.parse(self.params)
  end
end
