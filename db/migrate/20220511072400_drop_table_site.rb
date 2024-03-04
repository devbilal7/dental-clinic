class DropTableSite < ActiveRecord::Migration[7.0]
  def change
    drop_table :sites
  end
end
