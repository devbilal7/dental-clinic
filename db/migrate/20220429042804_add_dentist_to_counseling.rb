class AddDentistToCounseling < ActiveRecord::Migration[7.0]
  def change
    add_reference :counselings, :dentist, null: false
  end
end
