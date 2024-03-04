class CreateDentistAggregations < ActiveRecord::Migration[7.0]
  def change
    create_table :dentist_aggregations do |t|
      t.integer :no_of_reservations
      t.integer :actual_visit_patients
      t.integer :insurance_peoples
      t.integer :emergency_patients
      t.integer :new_patients
      t.integer :re_entry_patients
      t.integer :patients_finished
      t.integer :no_of_cancellations
      t.integer :no_notice_cancellations
      t.integer :score
      t.integer :own_expense_amount_money
      t.integer :miscellaneous_income
      t.integer :own_expense_people
      t.integer :no_of_people
      t.integer :actual_examinations
      t.integer :referral_card
      t.integer :referral_patients
      t.integer :people_returning_home
      t.integer :payment_people
      t.integer :through_no_of_reservations
      t.integer :through_rate
      t.integer :actual_visit_peoples
      t.integer :introduction_card
      t.integer :introduction_patients
      t.integer :referral_rate

      t.timestamps
    end
  end
end
