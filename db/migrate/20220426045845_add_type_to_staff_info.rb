class AddTypeToStaffInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :staff_infos, :type, :string
  end
end
