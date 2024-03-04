require 'rails_helper'

RSpec.describe "dh_aggregations/show", type: :view do
  before(:each) do
    @dh_aggregation = assign(:dh_aggregation, DhAggregation.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/No Of Reservations/)
    expect(rendered).to match(/People Maintenance/)
    expect(rendered).to match(/People Treatment/)
    expect(rendered).to match(/People Own Expense/)
    expect(rendered).to match(/Oral Count/)
    expect(rendered).to match(/Out Of The Decline/)
    expect(rendered).to match(/Cancellation Tel/)
    expect(rendered).to match(/Cancellation Without/)
    expect(rendered).to match(/Insurance Maintenance/)
    expect(rendered).to match(/Insurance Treatment/)
    expect(rendered).to match(/Own Income/)
    expect(rendered).to match(/Miscc Income/)
    expect(rendered).to match(/No Of People/)
    expect(rendered).to match(/Appt Confm People/)
    expect(rendered).to match(/Interval 1m People/)
    expect(rendered).to match(/Interval 1m Tel/)
    expect(rendered).to match(/Interval 1m Without/)
    expect(rendered).to match(/Interval 2m People/)
    expect(rendered).to match(/Interval 2m Tel/)
    expect(rendered).to match(/Interval 2m Without/)
    expect(rendered).to match(/Interval 3m People/)
    expect(rendered).to match(/Interval 3m Tel/)
    expect(rendered).to match(/Interval 3m Without/)
    expect(rendered).to match(/Interval 4m People/)
    expect(rendered).to match(/Interval 4m Tel/)
    expect(rendered).to match(/Interval 4m Without/)
    expect(rendered).to match(/Interval 6m People/)
    expect(rendered).to match(/Interval 6m Tel/)
    expect(rendered).to match(/Interval 6m Without/)
    expect(rendered).to match(/Spt2/)
    expect(rendered).to match(/Spt1/)
    expect(rendered).to match(/G P Heavy Defense/)
    expect(rendered).to match(/No Of Referrals/)
    expect(rendered).to match(/Note/)
  end
end
