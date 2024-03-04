require 'rails_helper'

RSpec.describe "visit_route_masters/new", type: :view do
  before(:each) do
    assign(:visit_route_master, VisitRouteMaster.new(
      visit_route_code: "MyString",
      visit_route_name: "MyString"
    ))
  end

  it "renders new visit_route_master form" do
    render

    assert_select "form[action=?][method=?]", visit_route_masters_path, "post" do

      assert_select "input[name=?]", "visit_route_master[visit_route_code]"

      assert_select "input[name=?]", "visit_route_master[visit_route_name]"
    end
  end
end
