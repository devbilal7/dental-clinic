require 'rails_helper'

RSpec.describe "pcourses/index", type: :view do
  before(:each) do
    assign(:pcourses, [
      Pcourse.create!(
        name: "Name",
        code: "Code"
      ),
      Pcourse.create!(
        name: "Name",
        code: "Code"
      )
    ])
  end

  it "renders a list of pcourses" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Code".to_s, count: 2
  end
end
