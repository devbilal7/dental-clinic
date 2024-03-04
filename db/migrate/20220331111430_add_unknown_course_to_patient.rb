class AddUnknownCourseToPatient < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :unknown_course, :string
  end
end
