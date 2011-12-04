class User < ActiveRecord::Base
  devise :omniauthable
  
  def self.find_or_create_by_facebook(access_token)
    data = access_token['info']
    self.find_or_create_by_email(data["email"],
      :avatar_url => data['image'],
      :name => data['name'],
      :facebook_id => access_token['extra']['raw_info']['id'],
      :username => data['nickname'],
      :sex => access_token['extra']['raw_info']['gender'],
      :facebook_token => access_token['credentials']['token'])
  end
end