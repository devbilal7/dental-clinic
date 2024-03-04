require 'rails_helper'

RSpec.describe "pcourses/show", type: :view do
  before(:each) do
    @pcourse = assign(:pcourse, Pcourse.create!(
      name: "Name",
      code: "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
  end
end
