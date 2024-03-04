require 'rails_helper'

RSpec.describe "dentist_aggregations/edit", type: :view do
  before(:each) do
    @dentist_aggregation = assign(:dentist_aggregation, DentistAggregation.create!(
      no_of_reservations: "MyString",
      actual_visit_patients: "MyString",
      insurance_peoples: "MyString",
      emergency_patients: "MyString",
      new_patients: "MyString",
      re_entry_patients: "MyString",
      patients_finished: "MyString",
      no_of_cancellations: "MyString",
      no_notice_cancellations: "MyString",
      score: "MyString",
      own_expense_amount_money: "MyString",
      miscellaneous_income: "MyString",
      own_expense_people: "MyString",
      no_of_people: "MyString",
      actual_examinations: "MyString",
      referral_card: "MyString",
      referral_patients: "MyString",
      people_returning_home: "MyString",
      payment_people: "MyString",
      through_no_of_reservations: "MyString",
      through_rate: "MyString",
      actual_visit_peoples: "MyString",
      introduction_card: "MyString",
      introduction_patients: "MyString",
      referral_rate: "MyString"
    ))
  end

  it "renders the edit dentist_aggregation form" do
    render

    assert_select "form[action=?][method=?]", dentist_aggregation_path(@dentist_aggregation), "post" do

      assert_select "input[name=?]", "dentist_aggregation[no_of_reservations]"

      assert_select "input[name=?]", "dentist_aggregation[actual_visit_patients]"

      assert_select "input[name=?]", "dentist_aggregation[insurance_peoples]"

      assert_select "input[name=?]", "dentist_aggregation[emergency_patients]"

      assert_select "input[name=?]", "dentist_aggregation[new_patients]"

      assert_select "input[name=?]", "dentist_aggregation[re_entry_patients]"

      assert_select "input[name=?]", "dentist_aggregation[patients_finished]"

      assert_select "input[name=?]", "dentist_aggregation[no_of_cancellations]"

      assert_select "input[name=?]", "dentist_aggregation[no_notice_cancellations]"

      assert_select "input[name=?]", "dentist_aggregation[score]"

      assert_select "input[name=?]", "dentist_aggregation[own_expense_amount_money]"

      assert_select "input[name=?]", "dentist_aggregation[miscellaneous_income]"

      assert_select "input[name=?]", "dentist_aggregation[own_expense_people]"

      assert_select "input[name=?]", "dentist_aggregation[no_of_people]"

      assert_select "input[name=?]", "dentist_aggregation[actual_examinations]"

      assert_select "input[name=?]", "dentist_aggregation[referral_card]"

      assert_select "input[name=?]", "dentist_aggregation[referral_patients]"

      assert_select "input[name=?]", "dentist_aggregation[people_returning_home]"

      assert_select "input[name=?]", "dentist_aggregation[payment_people]"

      assert_select "input[name=?]", "dentist_aggregation[through_no_of_reservations]"

      assert_select "input[name=?]", "dentist_aggregation[through_rate]"

      assert_select "input[name=?]", "dentist_aggregation[actual_visit_peoples]"

      assert_select "input[name=?]", "dentist_aggregation[introduction_card]"

      assert_select "input[name=?]", "dentist_aggregation[introduction_patients]"

      assert_select "input[name=?]", "dentist_aggregation[referral_rate]"
    end
  end
end
