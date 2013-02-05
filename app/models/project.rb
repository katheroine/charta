class Project < ActiveRecord::Base
  attr_accessible :completion_date, :construction_img_path, :localization, :name, :project_img_path, :result_img_path, :rooms_number, :state, :surface_area
end
