class CreateMultipleVisitRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :multiple_visit_routes do |t|
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
