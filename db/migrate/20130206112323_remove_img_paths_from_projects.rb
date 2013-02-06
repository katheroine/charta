class RemoveImgPathsFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :project_img_path
    remove_column :projects, :construction_img_path
    remove_column :projects, :result_img_path
  end

  def down
    add_column :projects, :result_img_path, :string
    add_column :projects, :construction_img_path, :string
    add_column :projects, :project_img_path, :string
  end
end
