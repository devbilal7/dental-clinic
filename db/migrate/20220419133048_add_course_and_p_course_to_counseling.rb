class AddCourseAndPCourseToCounseling < ActiveRecord::Migration[7.0]
  def change
    add_reference :counselings, :course, null: false, foreign_key: true
    add_reference :counselings, :pcourse, null: false, foreign_key: true
  end
end
