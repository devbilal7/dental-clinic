require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        name: "Name",
        code: "Code"
      ),
      Course.create!(
        name: "Name",
        code: "Code"
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Code".to_s, count: 2
  end
end
