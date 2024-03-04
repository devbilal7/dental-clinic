require 'rails_helper'

RSpec.describe "contract_types/edit", type: :view do
  before(:each) do
    @contract_type = assign(:contract_type, ContractType.create!(
      contract_type_code: "MyString",
      contract_type_name: "MyString"
    ))
  end

  it "renders the edit contract_type form" do
    render

    assert_select "form[action=?][method=?]", contract_type_path(@contract_type), "post" do

      assert_select "input[name=?]", "contract_type[contract_type_code]"

      assert_select "input[name=?]", "contract_type[contract_type_name]"
    end
  end
end
