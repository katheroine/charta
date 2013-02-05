class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :completion_date
      t.string :localization
      t.integer :rooms_number
      t.integer :surface_area
      t.string :state
      t.string :project_img_path
      t.string :construction_img_path
      t.string :result_img_path

      t.timestamps
    end
  end
end
