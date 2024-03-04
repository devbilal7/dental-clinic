class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.references :dentist_hygienist, null: false
      t.references :dentist, null: false
      t.references :treatment_coordinator, null: false

      t.timestamps
    end
  end
end
