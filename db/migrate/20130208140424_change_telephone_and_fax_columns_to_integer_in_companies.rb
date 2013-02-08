class ChangeTelephoneAndFaxColumnsToIntegerInCompanies < ActiveRecord::Migration
  def up
  	change_column :companies, :telephone, :integer
  	change_column :companies, :fax, :integer
  end

  def down
  	change_column :companies, :telephone, :decimal
  	change_column :companies, :fax, :decimal
  end
end
