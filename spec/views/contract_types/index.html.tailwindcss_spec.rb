require 'rails_helper'

RSpec.describe "contract_types/index", type: :view do
  before(:each) do
    assign(:contract_types, [
      ContractType.create!(
        contract_type_code: "Contract Type Code",
        contract_type_name: "Contract Type Name"
      ),
      ContractType.create!(
        contract_type_code: "Contract Type Code",
        contract_type_name: "Contract Type Name"
      )
    ])
  end

  it "renders a list of contract_types" do
    render
    assert_select "tr>td", text: "Contract Type Code".to_s, count: 2
    assert_select "tr>td", text: "Contract Type Name".to_s, count: 2
  end
end
