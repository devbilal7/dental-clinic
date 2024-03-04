require 'rails_helper'

RSpec.describe "sites/show", type: :view do
  before(:each) do
    @site = assign(:site, Site.create!(
      part_code: "Part Code",
      part_name: "Part Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Part Code/)
    expect(rendered).to match(/Part Name/)
  end
end
