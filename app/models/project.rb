class Project < ActiveRecord::Base
  attr_accessible  :name, :localization, :state, :completion_date, :rooms_number, :surface_area,
  :project_img, :construction_img, :result_img
  
  STATES = ["at the planning stage", "under construction", "completed"]
  
  validates :name, :presence => :true, :uniqueness => :true, :length => { :maximum => 32 }
  validates :localization, :presence => :true, :length => { :maximum => 64 }
  validates :state, :presence => :true, :inclusion => STATES
  validates :completion_date, :presence => :true, :if => "state == 'completed'"
  validates :rooms_number, :numericality => { :only_integer => :true }, :allow_nil => :true
  validates :surface_area, :numericality => :true, :allow_nil => :true
  validates :project_img, :presence => :true
  validates :construction_img, :presence => :true, :if => "state == 'under construction' || state == 'completed'"
  validates :result_img, :presence => :true, :if => "state == 'completed'"
  
  has_attached_file :project_img,
		:styles => {
			:thumb => "150x100#",
			:small => "430x160>" }
	
	has_attached_file :construction_img,
		:styles => {
			:thumb => "150x100#",
			:small => "430x160>" }
			
	has_attached_file :result_img,
		:styles => {
			:thumb => "150x100#",
			:small => "430x160>" }
end
