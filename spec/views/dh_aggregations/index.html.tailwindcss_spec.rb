require 'rails_helper'

RSpec.describe "dh_aggregations/index", type: :view do
  before(:each) do
    assign(:dh_aggregations, [
      DhAggregation.create!(
        no_of_reservations: "No Of Reservations",
        people_maintenance: "People Maintenance",
        people_treatment: "People Treatment",
        people_own_expense: "People Own Expense",
        oral_count: "Oral Count",
        out_of_the_decline: "Out Of The Decline",
        cancellation_tel: "Cancellation Tel",
        cancellation_without: "Cancellation Without",
        insurance_maintenance: "Insurance Maintenance",
        insurance_treatment: "Insurance Treatment",
        own_income: "Own Income",
        miscc_income: "Miscc Income",
        no_of_people: "No Of People",
        appt_confm_people: "Appt Confm People",
        interval_1m_people: "Interval 1m People",
        interval_1m_tel: "Interval 1m Tel",
        interval_1m_without: "Interval 1m Without",
        interval_2m_people: "Interval 2m People",
        interval_2m_tel: "Interval 2m Tel",
        interval_2m_without: "Interval 2m Without",
        interval_3m_people: "Interval 3m People",
        interval_3m_tel: "Interval 3m Tel",
        interval_3m_without: "Interval 3m Without",
        interval_4m_people: "Interval 4m People",
        interval_4m_tel: "Interval 4m Tel",
        interval_4m_without: "Interval 4m Without",
        interval_6m_people: "Interval 6m People",
        interval_6m_tel: "Interval 6m Tel",
        interval_6m_without: "Interval 6m Without",
        spt2: "Spt2",
        spt1: "Spt1",
        g_p_heavy_defense: "G P Heavy Defense",
        no_of_referrals: "No Of Referrals",
        note: "Note"
      ),
      DhAggregation.create!(
        no_of_reservations: "No Of Reservations",
        people_maintenance: "People Maintenance",
        people_treatment: "People Treatment",
        people_own_expense: "People Own Expense",
        oral_count: "Oral Count",
        out_of_the_decline: "Out Of The Decline",
        cancellation_tel: "Cancellation Tel",
        cancellation_without: "Cancellation Without",
        insurance_maintenance: "Insurance Maintenance",
        insurance_treatment: "Insurance Treatment",
        own_income: "Own Income",
        miscc_income: "Miscc Income",
        no_of_people: "No Of People",
        appt_confm_people: "Appt Confm People",
        interval_1m_people: "Interval 1m People",
        interval_1m_tel: "Interval 1m Tel",
        interval_1m_without: "Interval 1m Without",
        interval_2m_people: "Interval 2m People",
        interval_2m_tel: "Interval 2m Tel",
        interval_2m_without: "Interval 2m Without",
        interval_3m_people: "Interval 3m People",
        interval_3m_tel: "Interval 3m Tel",
        interval_3m_without: "Interval 3m Without",
        interval_4m_people: "Interval 4m People",
        interval_4m_tel: "Interval 4m Tel",
        interval_4m_without: "Interval 4m Without",
        interval_6m_people: "Interval 6m People",
        interval_6m_tel: "Interval 6m Tel",
        interval_6m_without: "Interval 6m Without",
        spt2: "Spt2",
        spt1: "Spt1",
        g_p_heavy_defense: "G P Heavy Defense",
        no_of_referrals: "No Of Referrals",
        note: "Note"
      )
    ])
  end

  it "renders a list of dh_aggregations" do
    render
    assert_select "tr>td", text: "No Of Reservations".to_s, count: 2
    assert_select "tr>td", text: "People Maintenance".to_s, count: 2
    assert_select "tr>td", text: "People Treatment".to_s, count: 2
    assert_select "tr>td", text: "People Own Expense".to_s, count: 2
    assert_select "tr>td", text: "Oral Count".to_s, count: 2
    assert_select "tr>td", text: "Out Of The Decline".to_s, count: 2
    assert_select "tr>td", text: "Cancellation Tel".to_s, count: 2
    assert_select "tr>td", text: "Cancellation Without".to_s, count: 2
    assert_select "tr>td", text: "Insurance Maintenance".to_s, count: 2
    assert_select "tr>td", text: "Insurance Treatment".to_s, count: 2
    assert_select "tr>td", text: "Own Income".to_s, count: 2
    assert_select "tr>td", text: "Miscc Income".to_s, count: 2
    assert_select "tr>td", text: "No Of People".to_s, count: 2
    assert_select "tr>td", text: "Appt Confm People".to_s, count: 2
    assert_select "tr>td", text: "Interval 1m People".to_s, count: 2
    assert_select "tr>td", text: "Interval 1m Tel".to_s, count: 2
    assert_select "tr>td", text: "Interval 1m Without".to_s, count: 2
    assert_select "tr>td", text: "Interval 2m People".to_s, count: 2
    assert_select "tr>td", text: "Interval 2m Tel".to_s, count: 2
    assert_select "tr>td", text: "Interval 2m Without".to_s, count: 2
    assert_select "tr>td", text: "Interval 3m People".to_s, count: 2
    assert_select "tr>td", text: "Interval 3m Tel".to_s, count: 2
    assert_select "tr>td", text: "Interval 3m Without".to_s, count: 2
    assert_select "tr>td", text: "Interval 4m People".to_s, count: 2
    assert_select "tr>td", text: "Interval 4m Tel".to_s, count: 2
    assert_select "tr>td", text: "Interval 4m Without".to_s, count: 2
    assert_select "tr>td", text: "Interval 6m People".to_s, count: 2
    assert_select "tr>td", text: "Interval 6m Tel".to_s, count: 2
    assert_select "tr>td", text: "Interval 6m Without".to_s, count: 2
    assert_select "tr>td", text: "Spt2".to_s, count: 2
    assert_select "tr>td", text: "Spt1".to_s, count: 2
    assert_select "tr>td", text: "G P Heavy Defense".to_s, count: 2
    assert_select "tr>td", text: "No Of Referrals".to_s, count: 2
    assert_select "tr>td", text: "Note".to_s, count: 2
  end
end
