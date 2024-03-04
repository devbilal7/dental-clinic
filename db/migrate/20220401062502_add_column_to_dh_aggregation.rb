class AddColumnToDhAggregation < ActiveRecord::Migration[7.0]
  def change
    add_column :dh_aggregations, :oral_func, :string
    add_column :dh_aggregations, :med_prac_rev, :string
    add_column :dh_aggregations, :act_med_exam_days, :string
    add_column :dh_aggregations, :one_day_no_reservation, :string
    add_reference :dh_aggregations, :clinic, null: false, foreign_key: true
  end
end
