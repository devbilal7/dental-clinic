class AddColumnToStaffInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :staff_infos, :first_name_kana, :string
    add_column :staff_infos, :last_name_kana, :string
  end
end
