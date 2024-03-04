require 'rails_helper'

RSpec.describe "visit_route_masters/index", type: :view do
  before(:each) do
    assign(:visit_route_masters, [
      VisitRouteMaster.create!(
        visit_route_code: "Visit Route Code",
        visit_route_name: "Visit Route Name"
      ),
      VisitRouteMaster.create!(
        visit_route_code: "Visit Route Code",
        visit_route_name: "Visit Route Name"
      )
    ])
  end

  it "renders a list of visit_route_masters" do
    render
    assert_select "tr>td", text: "Visit Route Code".to_s, count: 2
    assert_select "tr>td", text: "Visit Route Name".to_s, count: 2
  end
end
