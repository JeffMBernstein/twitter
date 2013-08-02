class User < ActiveRecord::Base
  has_many :tweets
  has_secure_password
  mount_uploader :avatar, AvatarUploader
end
