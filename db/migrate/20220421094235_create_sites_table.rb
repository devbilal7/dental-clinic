class CreateSitesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :part_code
      t.string :part_name

      t.timestamps
    end
  end
end
