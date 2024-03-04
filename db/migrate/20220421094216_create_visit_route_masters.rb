class CreateVisitRouteMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :visit_route_masters do |t|
      t.string :visit_route_code
      t.string :visit_route_name

      t.timestamps
    end
  end
end
