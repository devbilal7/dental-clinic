class AddDefenseCalculationToVisitRoute < ActiveRecord::Migration[7.0]
  def change
    add_column :visit_routes, :p_heavy_defense_calculation, :boolean
  end
end
