require 'rails_helper'

RSpec.describe "prosthodontic_masters/new", type: :view do
  before(:each) do
    assign(:prosthodontic_master, ProsthodonticMaster.new(
      prosthodontic_code: "MyString",
      prosthodontic_name: "MyString"
    ))
  end

  it "renders new prosthodontic_master form" do
    render

    assert_select "form[action=?][method=?]", prosthodontic_masters_path, "post" do

      assert_select "input[name=?]", "prosthodontic_master[prosthodontic_code]"

      assert_select "input[name=?]", "prosthodontic_master[prosthodontic_name]"
    end
  end
end
