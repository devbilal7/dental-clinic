class CreateClinicIps < ActiveRecord::Migration[7.0]
  def change
    create_table :clinic_ips do |t|
      t.string :ip
      t.datetime :last_login
      t.references :clinic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
