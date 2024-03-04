require 'rails_helper'

RSpec.describe "occupation_masters/show", type: :view do
  before(:each) do
    @occupation_master = assign(:occupation_master, OccupationMaster.create!(
      job_code: "Job Code",
      job_title: "Job Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Job Code/)
    expect(rendered).to match(/Job Title/)
  end
end
