require 'rails_helper'

RSpec.describe "contract_types/show", type: :view do
  before(:each) do
    @contract_type = assign(:contract_type, ContractType.create!(
      contract_type_code: "Contract Type Code",
      contract_type_name: "Contract Type Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Contract Type Code/)
    expect(rendered).to match(/Contract Type Name/)
  end
end
