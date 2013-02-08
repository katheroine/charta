require 'digest/sha2'

class Admin < ActiveRecord::Base
  attr_accessible :login, :email, :is_root, :name, :surname, :bio, :hashed_password, :salt, :password, :password_confirmation
  attr_reader :password
  
  validates :password, :presence => true, :confirmation => true, :length => { :within => 8..32 }, :on => :create
  validates :password, :confirmation => true, :length => { :within => 8..32 }, :on => :update, :unless => lambda{ |admin| admin.password.blank? } 
  validates :login, :email, :presence => :true
  
  private
  
  def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
  end
  
  def Admin.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)
  end
  
  public
  
  def Admin.authenticate(login, password)
    if admin = Admin.find_by_login(login)
      admin if admin.hashed_password == encrypt_password(password, admin.salt)
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
