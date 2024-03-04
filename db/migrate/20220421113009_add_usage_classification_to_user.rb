class AddUsageClassificationToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :usage_classification, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :kana_first_name, :string
    add_column :users, :kana_last_name, :string
  end
end
