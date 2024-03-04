require 'rails_helper'

RSpec.describe "visit_route_masters/show", type: :view do
  before(:each) do
    @visit_route_master = assign(:visit_route_master, VisitRouteMaster.create!(
      visit_route_code: "Visit Route Code",
      visit_route_name: "Visit Route Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Visit Route Code/)
    expect(rendered).to match(/Visit Route Name/)
  end
end
