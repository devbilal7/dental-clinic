require 'rails_helper'

RSpec.describe "occupation_masters/new", type: :view do
  before(:each) do
    assign(:occupation_master, OccupationMaster.new(
      job_code: "MyString",
      job_title: "MyString"
    ))
  end

  it "renders new occupation_master form" do
    render

    assert_select "form[action=?][method=?]", occupation_masters_path, "post" do

      assert_select "input[name=?]", "occupation_master[job_code]"

      assert_select "input[name=?]", "occupation_master[job_title]"
    end
  end
end
