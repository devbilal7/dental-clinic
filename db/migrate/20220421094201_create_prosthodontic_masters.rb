class CreateProsthodonticMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :prosthodontic_masters do |t|
      t.string :prosthodontic_code
      t.string :prosthodontic_name

      t.timestamps
    end
  end
end
