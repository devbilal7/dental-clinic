class VisitRoute < ApplicationRecord
  # audited
  belongs_to :multiple_visit_route
  # validates :next_reservation_date, comparison: { greater_than_or_equal_to: Date.today,message: "Wrong Date Entered" }
  # validates :first_visit, comparison: { less_than_or_equal_to: Date.today,message: "Wrong Date Entered" }, presence: true
  # validates :second, comparison: { less_than_or_equal_to: Date.today,message: "Wrong Date Entered" }, presence: true 
  enum role: { Dentist: 'Dentist', Dentist_Hygienist: 'Dentist_Hygienist', TreatmentCoordinator: "TreatmentCoordinator"}, _default: " "

end
