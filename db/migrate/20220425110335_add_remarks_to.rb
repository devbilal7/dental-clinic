class AddRemarksTo < ActiveRecord::Migration[7.0]
  def change
    add_column :occupation_masters, :remarks, :string
    add_column :occupation_masters, :master_name, :string
    add_column :visit_route_masters, :remarks, :string
    add_column :visit_route_masters, :master_name, :string
    add_column :contract_types, :remarks, :string
    add_column :contract_types, :master_name, :string
    add_column :prosthodontic_masters, :remarks, :string
    add_column :prosthodontic_masters, :master_name, :string
    add_column :courses, :remarks, :string
    add_column :courses, :master_name, :string
    add_column :pcourses, :remarks, :string
    add_column :pcourses, :master_name, :string
  end
end
