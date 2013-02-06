class Project < ActiveRecord::Base
  attr_accessible :completion_date, :construction_img_path, :localization, :name, :rooms_number, :state, :surface_area,
  :project_img, :construction_img, :result_img
  
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
