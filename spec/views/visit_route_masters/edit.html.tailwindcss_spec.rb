require 'rails_helper'

RSpec.describe "visit_route_masters/edit", type: :view do
  before(:each) do
    @visit_route_master = assign(:visit_route_master, VisitRouteMaster.create!(
      visit_route_code: "MyString",
      visit_route_name: "MyString"
    ))
  end

  it "renders the edit visit_route_master form" do
    render

    assert_select "form[action=?][method=?]", visit_route_master_path(@visit_route_master), "post" do

      assert_select "input[name=?]", "visit_route_master[visit_route_code]"

      assert_select "input[name=?]", "visit_route_master[visit_route_name]"
    end
  end
end
