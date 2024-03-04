class CreateDhAggregations < ActiveRecord::Migration[7.0]
  def change
    create_table :dh_aggregations do |t|
      t.string :no_of_reservations
      t.string :people_maintenance
      t.string :people_treatment
      t.string :people_own_expense
      t.string :oral_count
      t.string :out_of_the_decline
      t.string :cancellation_tel
      t.string :cancellation_without
      t.string :insurance_maintenance
      t.string :insurance_treatment
      t.string :own_income
      t.string :miscc_income
      t.string :no_of_people
      t.string :appt_confm_people
      t.string :interval_1m_people
      t.string :interval_1m_tel
      t.string :interval_1m_without
      t.string :interval_2m_people
      t.string :interval_2m_tel
      t.string :interval_2m_without
      t.string :interval_3m_people
      t.string :interval_3m_tel
      t.string :interval_3m_without
      t.string :interval_4m_people
      t.string :interval_4m_tel
      t.string :interval_4m_without
      t.string :interval_6m_people
      t.string :interval_6m_tel
      t.string :interval_6m_without
      t.string :spt2
      t.string :spt1
      t.string :g_p_heavy_defense
      t.string :no_of_referrals
      t.string :note

      t.timestamps
    end
  end
end
