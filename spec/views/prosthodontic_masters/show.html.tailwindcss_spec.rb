require 'rails_helper'

RSpec.describe "prosthodontic_masters/show", type: :view do
  before(:each) do
    @prosthodontic_master = assign(:prosthodontic_master, ProsthodonticMaster.create!(
      prosthodontic_code: "Prosthodontic Code",
      prosthodontic_name: "Prosthodontic Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Prosthodontic Code/)
    expect(rendered).to match(/Prosthodontic Name/)
  end
end
