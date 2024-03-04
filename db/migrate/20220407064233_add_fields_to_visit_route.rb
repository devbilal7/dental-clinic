class AddFieldsToVisitRoute < ActiveRecord::Migration[7.0]
  def change
    add_column :visit_routes, :introducer_name, :string
    add_column :visit_routes, :charge_job_type, :string
    add_column :visit_routes, :person_in_charge, :string
  end
end
