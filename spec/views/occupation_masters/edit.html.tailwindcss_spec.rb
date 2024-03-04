require 'rails_helper'

RSpec.describe "occupation_masters/edit", type: :view do
  before(:each) do
    @occupation_master = assign(:occupation_master, OccupationMaster.create!(
      job_code: "MyString",
      job_title: "MyString"
    ))
  end

  it "renders the edit occupation_master form" do
    render

    assert_select "form[action=?][method=?]", occupation_master_path(@occupation_master), "post" do

      assert_select "input[name=?]", "occupation_master[job_code]"

      assert_select "input[name=?]", "occupation_master[job_title]"
    end
  end
end
