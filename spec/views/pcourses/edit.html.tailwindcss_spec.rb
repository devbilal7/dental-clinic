require 'rails_helper'

RSpec.describe "pcourses/edit", type: :view do
  before(:each) do
    @pcourse = assign(:pcourse, Pcourse.create!(
      name: "MyString",
      code: "MyString"
    ))
  end

  it "renders the edit pcourse form" do
    render

    assert_select "form[action=?][method=?]", pcourse_path(@pcourse), "post" do

      assert_select "input[name=?]", "pcourse[name]"

      assert_select "input[name=?]", "pcourse[code]"
    end
  end
end
