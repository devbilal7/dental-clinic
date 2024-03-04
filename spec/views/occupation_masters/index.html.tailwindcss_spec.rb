require 'rails_helper'

RSpec.describe "occupation_masters/index", type: :view do
  before(:each) do
    assign(:occupation_masters, [
      OccupationMaster.create!(
        job_code: "Job Code",
        job_title: "Job Title"
      ),
      OccupationMaster.create!(
        job_code: "Job Code",
        job_title: "Job Title"
      )
    ])
  end

  it "renders a list of occupation_masters" do
    render
    assert_select "tr>td", text: "Job Code".to_s, count: 2
    assert_select "tr>td", text: "Job Title".to_s, count: 2
  end
end
