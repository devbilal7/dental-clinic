require 'rails_helper'

RSpec.describe "sites/index", type: :view do
  before(:each) do
    assign(:sites, [
      Site.create!(
        part_code: "Part Code",
        part_name: "Part Name"
      ),
      Site.create!(
        part_code: "Part Code",
        part_name: "Part Name"
      )
    ])
  end

  it "renders a list of sites" do
    render
    assert_select "tr>td", text: "Part Code".to_s, count: 2
    assert_select "tr>td", text: "Part Name".to_s, count: 2
  end
end
