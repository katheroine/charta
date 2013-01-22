class Company < ActiveRecord::Base
  attr_accessible :apartment, :city, :description, :email, :fax, :name, :services, :street, :telephone
  
  validates :apartment, :city, :description, :email, :fax, :name, :services, :street, :telephone, :presence => :true
end
