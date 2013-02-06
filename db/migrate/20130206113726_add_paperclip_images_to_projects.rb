class AddPaperclipImagesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_img_file_name, :string
    add_column :projects, :project_img_content_type, :string
    add_column :projects, :project_img_file_size, :integer
    add_column :projects, :construction_img_file_name, :string
    add_column :projects, :construction_img_content_type, :string
    add_column :projects, :construction_img_file_size, :integer
    add_column :projects, :result_img_file_name, :string
    add_column :projects, :result_img_content_type, :string
    add_column :projects, :result_img_file_size, :integer
  end
end
