class RemovePatientReferenceFromVisitRoute < ActiveRecord::Migration[7.0]
  def change
    remove_reference :visit_routes, :patient, null: false, foreign_key: true
  end
end
