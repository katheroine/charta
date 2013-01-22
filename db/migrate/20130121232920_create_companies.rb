class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.text :services
      t.string :city
      t.string :street
      t.string :apartment
      t.decimal :telephone
      t.decimal :fax
      t.string :email

      t.timestamps
    end
  end
end
