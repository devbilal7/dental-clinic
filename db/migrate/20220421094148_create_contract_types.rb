class CreateContractTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :contract_types do |t|
      t.string :contract_type_code
      t.string :contract_type_name

      t.timestamps
    end
  end
end
