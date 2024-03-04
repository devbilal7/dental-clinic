class CreateOccupationMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :occupation_masters do |t|
      t.string :job_code
      t.string :job_title

      t.timestamps
    end
  end
end
