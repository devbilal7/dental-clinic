class AddClinicToStaffInfo < ActiveRecord::Migration[7.0]
  def change
    add_reference :staff_infos, :clinic, null: false, foreign_key: true
  end
end
