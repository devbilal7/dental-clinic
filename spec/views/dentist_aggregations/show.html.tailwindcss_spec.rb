require 'rails_helper'

RSpec.describe "dentist_aggregations/show", type: :view do
  before(:each) do
    @dentist_aggregation = assign(:dentist_aggregation, DentistAggregation.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/No Of Reservations/)
    expect(rendered).to match(/Actual Visit Patients/)
    expect(rendered).to match(/Insurance Peoples/)
    expect(rendered).to match(/Emergency Patients/)
    expect(rendered).to match(/New Patients/)
    expect(rendered).to match(/Re Entry Patients/)
    expect(rendered).to match(/Patients Finished/)
    expect(rendered).to match(/No Of Cancellations/)
    expect(rendered).to match(/No Notice Cancellations/)
    expect(rendered).to match(/Score/)
    expect(rendered).to match(/Own Expense Amount Money/)
    expect(rendered).to match(/Miscellaneous Income/)
    expect(rendered).to match(/Own Expense People/)
    expect(rendered).to match(/No Of People/)
    expect(rendered).to match(/Actual Examinations/)
    expect(rendered).to match(/Referral Card/)
    expect(rendered).to match(/Referral Patients/)
    expect(rendered).to match(/People Returning Home/)
    expect(rendered).to match(/Payment People/)
    expect(rendered).to match(/Through No Of Reservations/)
    expect(rendered).to match(/Through Rate/)
    expect(rendered).to match(/Actual Visit Peoples/)
    expect(rendered).to match(/Introduction Card/)
    expect(rendered).to match(/Introduction Patients/)
    expect(rendered).to match(/Referral Rate/)
  end
end
