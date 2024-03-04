require 'rails_helper'

RSpec.describe "pcourses/new", type: :view do
  before(:each) do
    assign(:pcourse, Pcourse.new(
      name: "MyString",
      code: "MyString"
    ))
  end

  it "renders new pcourse form" do
    render

    assert_select "form[action=?][method=?]", pcourses_path, "post" do

      assert_select "input[name=?]", "pcourse[name]"

      assert_select "input[name=?]", "pcourse[code]"
    end
  end
end
