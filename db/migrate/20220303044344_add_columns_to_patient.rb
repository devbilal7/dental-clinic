class AddColumnsToPatient < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :patient_number, :integer
    add_column :patients, :patient_visit_route, :string
    add_column :patients, :keyword, :string
    add_column :patients, :panorama, :boolean
    add_column :patients, :caries_check, :boolean
    add_column :patients, :course, :string
    add_column :patients, :p_course, :string
    add_column :patients, :note, :text
  end
end
