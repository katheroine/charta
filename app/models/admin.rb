class Admin < ActiveRecord::Base
  attr_accessible :bio, :email, :hashed_password, :is_root, :login, :name, :salt, :surname
end
