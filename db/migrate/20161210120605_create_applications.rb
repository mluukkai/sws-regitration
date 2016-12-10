class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :firstname
      t.string :surename
      t.string :street
      t.string :zip
      t.string :city
      t.string :phone
      t.string :email
      t.string :born
      t.string :family

      t.timestamps null: false
    end
  end
end
