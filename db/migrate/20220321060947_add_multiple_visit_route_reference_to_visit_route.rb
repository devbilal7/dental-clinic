class AddMultipleVisitRouteReferenceToVisitRoute < ActiveRecord::Migration[7.0]
  def change
    add_reference :visit_routes, :multiple_visit_route, null: false, foreign_key: true
  end
end
