require 'rails_helper'

RSpec.describe "dh_aggregations/edit", type: :view do
  before(:each) do
    @dh_aggregation = assign(:dh_aggregation, DhAggregation.create!(
      no_of_reservations: "MyString",
      people_maintenance: "MyString",
      people_treatment: "MyString",
      people_own_expense: "MyString",
      oral_count: "MyString",
      out_of_the_decline: "MyString",
      cancellation_tel: "MyString",
      cancellation_without: "MyString",
      insurance_maintenance: "MyString",
      insurance_treatment: "MyString",
      own_income: "MyString",
      miscc_income: "MyString",
      no_of_people: "MyString",
      appt_confm_people: "MyString",
      interval_1m_people: "MyString",
      interval_1m_tel: "MyString",
      interval_1m_without: "MyString",
      interval_2m_people: "MyString",
      interval_2m_tel: "MyString",
      interval_2m_without: "MyString",
      interval_3m_people: "MyString",
      interval_3m_tel: "MyString",
      interval_3m_without: "MyString",
      interval_4m_people: "MyString",
      interval_4m_tel: "MyString",
      interval_4m_without: "MyString",
      interval_6m_people: "MyString",
      interval_6m_tel: "MyString",
      interval_6m_without: "MyString",
      spt2: "MyString",
      spt1: "MyString",
      g_p_heavy_defense: "MyString",
      no_of_referrals: "MyString",
      note: "MyString"
    ))
  end

  it "renders the edit dh_aggregation form" do
    render

    assert_select "form[action=?][method=?]", dh_aggregation_path(@dh_aggregation), "post" do

      assert_select "input[name=?]", "dh_aggregation[no_of_reservations]"

      assert_select "input[name=?]", "dh_aggregation[people_maintenance]"

      assert_select "input[name=?]", "dh_aggregation[people_treatment]"

      assert_select "input[name=?]", "dh_aggregation[people_own_expense]"

      assert_select "input[name=?]", "dh_aggregation[oral_count]"

      assert_select "input[name=?]", "dh_aggregation[out_of_the_decline]"

      assert_select "input[name=?]", "dh_aggregation[cancellation_tel]"

      assert_select "input[name=?]", "dh_aggregation[cancellation_without]"

      assert_select "input[name=?]", "dh_aggregation[insurance_maintenance]"

      assert_select "input[name=?]", "dh_aggregation[insurance_treatment]"

      assert_select "input[name=?]", "dh_aggregation[own_income]"

      assert_select "input[name=?]", "dh_aggregation[miscc_income]"

      assert_select "input[name=?]", "dh_aggregation[no_of_people]"

      assert_select "input[name=?]", "dh_aggregation[appt_confm_people]"

      assert_select "input[name=?]", "dh_aggregation[interval_1m_people]"

      assert_select "input[name=?]", "dh_aggregation[interval_1m_tel]"

      assert_select "input[name=?]", "dh_aggregation[interval_1m_without]"

      assert_select "input[name=?]", "dh_aggregation[interval_2m_people]"

      assert_select "input[name=?]", "dh_aggregation[interval_2m_tel]"

      assert_select "input[name=?]", "dh_aggregation[interval_2m_without]"

      assert_select "input[name=?]", "dh_aggregation[interval_3m_people]"

      assert_select "input[name=?]", "dh_aggregation[interval_3m_tel]"

      assert_select "input[name=?]", "dh_aggregation[interval_3m_without]"

      assert_select "input[name=?]", "dh_aggregation[interval_4m_people]"

      assert_select "input[name=?]", "dh_aggregation[interval_4m_tel]"

      assert_select "input[name=?]", "dh_aggregation[interval_4m_without]"

      assert_select "input[name=?]", "dh_aggregation[interval_6m_people]"

      assert_select "input[name=?]", "dh_aggregation[interval_6m_tel]"

      assert_select "input[name=?]", "dh_aggregation[interval_6m_without]"

      assert_select "input[name=?]", "dh_aggregation[spt2]"

      assert_select "input[name=?]", "dh_aggregation[spt1]"

      assert_select "input[name=?]", "dh_aggregation[g_p_heavy_defense]"

      assert_select "input[name=?]", "dh_aggregation[no_of_referrals]"

      assert_select "input[name=?]", "dh_aggregation[note]"
    end
  end
end
