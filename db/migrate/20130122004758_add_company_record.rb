class AddCompanyRecord < ActiveRecord::Migration
  def up
	Company.reset_column_information
	company = Company.new
	company.save	
  end

  def down
	Company.first.delete
  end
end
