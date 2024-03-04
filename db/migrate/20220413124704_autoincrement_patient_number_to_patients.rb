class AutoincrementPatientNumberToPatients < ActiveRecord::Migration[7.0]
  def up
    execute "ALTER SEQUENCE patients_id_seq MINVALUE 1000000 OWNED BY patients.id START WITH 1000000 RESTART 1000000;"
  end

  def down 
    drop_table :patients 
  end 
end
