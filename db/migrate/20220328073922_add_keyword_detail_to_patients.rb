class AddKeywordDetailToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :keyword_detail, :string
  end
end
