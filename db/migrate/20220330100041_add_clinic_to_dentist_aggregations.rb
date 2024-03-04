class AddClinicToDentistAggregations < ActiveRecord::Migration[7.0]
  def change
    add_reference :dentist_aggregations, :clinic, null: false, foreign_key: true
  end
end
