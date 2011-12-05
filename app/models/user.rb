class User < ActiveRecord::Base
  devise :omniauthable
  
  def self.find_or_create_by_facebook(data)
    self.find_or_create_by_facebook_id(data['extra']['raw_info']['id'], :facebook_token => data['credentials']['token'])
  end
end