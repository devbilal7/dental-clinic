class CreateVersionControls < ActiveRecord::Migration[7.0]
  def change
    create_table :version_controls do |t|
      t.string :title
      t.date :date_field
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
