require 'digest/sha2'

class Admin < ActiveRecord::Base
  attr_accessible :login, :email, :is_root, :name, :surname, :bio, :hashed_password, :salt, :password, :password_confirmation
  attr_reader :password
  
  validates :password, :confirmation => :true
  validates :password, :login, :email, :presence => :true
  
  private
  
  def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
  end
  
  def Admin.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)
  end
  
  public
  
  def Admin.authenticate(login, password)
    admin = Admin.find_by_login(login)
    if admin.hashed_password == encrypt_password(password, admin.salt)
      admin
    end
  end
  
  def password=(password)
		@password = password
		
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end
  end
end
