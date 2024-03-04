require 'rails_helper'

RSpec.describe "sites/new", type: :view do
  before(:each) do
    assign(:site, Site.new(
      part_code: "MyString",
      part_name: "MyString"
    ))
  end

  it "renders new site form" do
    render

    assert_select "form[action=?][method=?]", sites_path, "post" do

      assert_select "input[name=?]", "site[part_code]"

      assert_select "input[name=?]", "site[part_name]"
    end
  end
end
