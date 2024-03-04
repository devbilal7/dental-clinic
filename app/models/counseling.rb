class Counseling < ApplicationRecord
    validates :resp_couns_staff, presence: true
    has_many :oral_types, dependent: :destroy
    accepts_nested_attributes_for :oral_types
    belongs_to :patient
    belongs_to :course 
    belongs_to :pcourse
    has_many :sites
    belongs_to :dentist 
end



@first_visit = 0  
@second_visit = 0
@treat_plan = 0
@maintainance = 0                
@prostho = 0  