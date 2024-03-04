require 'rails_helper'

RSpec.describe "dentist_aggregations/index", type: :view do
  before(:each) do
    assign(:dentist_aggregations, [
      DentistAggregation.create!(
        no_of_reservations: "No Of Reservations",
        actual_visit_patients: "Actual Visit Patients",
        insurance_peoples: "Insurance Peoples",
        emergency_patients: "Emergency Patients",
        new_patients: "New Patients",
        re_entry_patients: "Re Entry Patients",
        patients_finished: "Patients Finished",
        no_of_cancellations: "No Of Cancellations",
        no_notice_cancellations: "No Notice Cancellations",
        score: "Score",
        own_expense_amount_money: "Own Expense Amount Money",
        miscellaneous_income: "Miscellaneous Income",
        own_expense_people: "Own Expense People",
        no_of_people: "No Of People",
        actual_examinations: "Actual Examinations",
        referral_card: "Referral Card",
        referral_patients: "Referral Patients",
        people_returning_home: "People Returning Home",
        payment_people: "Payment People",
        through_no_of_reservations: "Through No Of Reservations",
        through_rate: "Through Rate",
        actual_visit_peoples: "Actual Visit Peoples",
        introduction_card: "Introduction Card",
        introduction_patients: "Introduction Patients",
        referral_rate: "Referral Rate"
      ),
      DentistAggregation.create!(
        no_of_reservations: "No Of Reservations",
        actual_visit_patients: "Actual Visit Patients",
        insurance_peoples: "Insurance Peoples",
        emergency_patients: "Emergency Patients",
        new_patients: "New Patients",
        re_entry_patients: "Re Entry Patients",
        patients_finished: "Patients Finished",
        no_of_cancellations: "No Of Cancellations",
        no_notice_cancellations: "No Notice Cancellations",
        score: "Score",
        own_expense_amount_money: "Own Expense Amount Money",
        miscellaneous_income: "Miscellaneous Income",
        own_expense_people: "Own Expense People",
        no_of_people: "No Of People",
        actual_examinations: "Actual Examinations",
        referral_card: "Referral Card",
        referral_patients: "Referral Patients",
        people_returning_home: "People Returning Home",
        payment_people: "Payment People",
        through_no_of_reservations: "Through No Of Reservations",
        through_rate: "Through Rate",
        actual_visit_peoples: "Actual Visit Peoples",
        introduction_card: "Introduction Card",
        introduction_patients: "Introduction Patients",
        referral_rate: "Referral Rate"
      )
    ])
  end

  it "renders a list of dentist_aggregations" do
    render
    assert_select "tr>td", text: "No Of Reservations".to_s, count: 2
    assert_select "tr>td", text: "Actual Visit Patients".to_s, count: 2
    assert_select "tr>td", text: "Insurance Peoples".to_s, count: 2
    assert_select "tr>td", text: "Emergency Patients".to_s, count: 2
    assert_select "tr>td", text: "New Patients".to_s, count: 2
    assert_select "tr>td", text: "Re Entry Patients".to_s, count: 2
    assert_select "tr>td", text: "Patients Finished".to_s, count: 2
    assert_select "tr>td", text: "No Of Cancellations".to_s, count: 2
    assert_select "tr>td", text: "No Notice Cancellations".to_s, count: 2
    assert_select "tr>td", text: "Score".to_s, count: 2
    assert_select "tr>td", text: "Own Expense Amount Money".to_s, count: 2
    assert_select "tr>td", text: "Miscellaneous Income".to_s, count: 2
    assert_select "tr>td", text: "Own Expense People".to_s, count: 2
    assert_select "tr>td", text: "No Of People".to_s, count: 2
    assert_select "tr>td", text: "Actual Examinations".to_s, count: 2
    assert_select "tr>td", text: "Referral Card".to_s, count: 2
    assert_select "tr>td", text: "Referral Patients".to_s, count: 2
    assert_select "tr>td", text: "People Returning Home".to_s, count: 2
    assert_select "tr>td", text: "Payment People".to_s, count: 2
    assert_select "tr>td", text: "Through No Of Reservations".to_s, count: 2
    assert_select "tr>td", text: "Through Rate".to_s, count: 2
    assert_select "tr>td", text: "Actual Visit Peoples".to_s, count: 2
    assert_select "tr>td", text: "Introduction Card".to_s, count: 2
    assert_select "tr>td", text: "Introduction Patients".to_s, count: 2
    assert_select "tr>td", text: "Referral Rate".to_s, count: 2
  end
end
