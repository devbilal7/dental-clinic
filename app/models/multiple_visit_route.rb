class MultipleVisitRoute < ApplicationRecord
  belongs_to :patient
  has_one :visit_route
  accepts_nested_attributes_for :visit_route

  amoeba do
    enable
  end
end
