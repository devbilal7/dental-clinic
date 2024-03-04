class AddNewFiledsToClinic < ActiveRecord::Migration[7.0]
  def change
    add_column :clinics, :representative_first_name, :string
    add_column :clinics, :representative_last_name, :string
    add_column :clinics, :representative_wonder1, :string
    add_column :clinics, :representative_wonder2, :string
    add_column :clinics, :charge1_first_name, :string
    add_column :clinics, :charge1_last_name, :string
    add_column :clinics, :charge1_wonder1, :string
    add_column :clinics, :charge1_wonder2, :string
    add_column :clinics, :charge2_first_name, :string
    add_column :clinics, :charge2_last_name, :string
    add_column :clinics, :charge2_wonder1, :string
    add_column :clinics, :charge2_wonder2, :string
  end
end
