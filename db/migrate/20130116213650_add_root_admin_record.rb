class AddRootAdminRecord < ActiveRecord::Migration
  def up
	Admin.reset_column_information
	root = Admin.new
	root.is_root = true
	root.login = 'root'
	root.password = 'root'
	root.save :validate => false
  end

  def down
	Admin.find_by_is_root(true).delete
  end
end
