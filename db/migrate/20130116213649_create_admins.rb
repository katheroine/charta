class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :login
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.boolean :is_root
      t.string :name
      t.string :surname
      t.text :bio

      t.timestamps
    end
  end
end
