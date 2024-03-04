class AddEmergencyToCounseling < ActiveRecord::Migration[7.0]
  def up
    add_column :counselings, :emergency, :boolean  
  end
  def down
    remove_column :counselings, :emergency, :boolean
  end
end
