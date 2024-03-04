class ChangeColumnTypeClinics < ActiveRecord::Migration[7.0]
  def change
    change_column :clinics, :phone_number, :string
  end
end
