class AddReferencesToDhAggregations < ActiveRecord::Migration[7.0]
  def change
    add_reference :dh_aggregations, :dentist_hygienist, null: false
  end
end
