class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :site_name
      t.float :site_offer_amount
      t.string :site_agreement
      t.date :site_consent_signing_date
      t.float :site_contract_amount
      t.references :counseling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
