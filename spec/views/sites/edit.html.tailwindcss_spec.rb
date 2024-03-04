require 'rails_helper'

RSpec.describe "sites/edit", type: :view do
  before(:each) do
    @site = assign(:site, Site.create!(
      part_code: "MyString",
      part_name: "MyString"
    ))
  end

  it "renders the edit site form" do
    render

    assert_select "form[action=?][method=?]", site_path(@site), "post" do

      assert_select "input[name=?]", "site[part_code]"

      assert_select "input[name=?]", "site[part_name]"
    end
  end
end
