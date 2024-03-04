class AddDentistToDentistAggregations < ActiveRecord::Migration[7.0]
  def change
    add_reference :dentist_aggregations, :dentist, null: false
  end
end
