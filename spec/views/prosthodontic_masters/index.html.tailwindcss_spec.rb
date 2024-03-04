require 'rails_helper'

RSpec.describe "prosthodontic_masters/index", type: :view do
  before(:each) do
    assign(:prosthodontic_masters, [
      ProsthodonticMaster.create!(
        prosthodontic_code: "Prosthodontic Code",
        prosthodontic_name: "Prosthodontic Name"
      ),
      ProsthodonticMaster.create!(
        prosthodontic_code: "Prosthodontic Code",
        prosthodontic_name: "Prosthodontic Name"
      )
    ])
  end

  it "renders a list of prosthodontic_masters" do
    render
    assert_select "tr>td", text: "Prosthodontic Code".to_s, count: 2
    assert_select "tr>td", text: "Prosthodontic Name".to_s, count: 2
  end
end
