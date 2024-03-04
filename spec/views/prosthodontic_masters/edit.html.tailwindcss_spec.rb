require 'rails_helper'

RSpec.describe "prosthodontic_masters/edit", type: :view do
  before(:each) do
    @prosthodontic_master = assign(:prosthodontic_master, ProsthodonticMaster.create!(
      prosthodontic_code: "MyString",
      prosthodontic_name: "MyString"
    ))
  end

  it "renders the edit prosthodontic_master form" do
    render

    assert_select "form[action=?][method=?]", prosthodontic_master_path(@prosthodontic_master), "post" do

      assert_select "input[name=?]", "prosthodontic_master[prosthodontic_code]"

      assert_select "input[name=?]", "prosthodontic_master[prosthodontic_name]"
    end
  end
end
