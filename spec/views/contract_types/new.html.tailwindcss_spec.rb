require 'rails_helper'

RSpec.describe "contract_types/new", type: :view do
  before(:each) do
    assign(:contract_type, ContractType.new(
      contract_type_code: "MyString",
      contract_type_name: "MyString"
    ))
  end

  it "renders new contract_type form" do
    render

    assert_select "form[action=?][method=?]", contract_types_path, "post" do

      assert_select "input[name=?]", "contract_type[contract_type_code]"

      assert_select "input[name=?]", "contract_type[contract_type_name]"
    end
  end
end
