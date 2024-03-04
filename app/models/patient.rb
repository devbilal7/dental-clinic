class Patient < ApplicationRecord
    audited
    after_create_commit :patient_id 
    belongs_to :dentist 
    belongs_to :dentist_hygienist
    belongs_to :treatment_coordinator
    belongs_to :clinic
    has_many :multiple_visit_routes
    has_many :counselings
    validates :patient_number, length: { maximum: 20 }
    validates :first_name, :last_name, presence: true

    # validates :patient_number, uniqueness: true 
    validates :note, length: { maximum: 200 }
    
    # validates :last_visit_date, comparison: { less_than_or_equal_to: Date.today,message: "Wrong Date Entered" }

    def full_name 
         self.last_name + "  " + self.first_name
    end 

    def last_appointment
        if self.multiple_visit_routes.present? 
            count = self.multiple_visit_routes.last.visit_route.audits.count
            self.multiple_visit_routes.last.visit_route.revision(count-1).next_reservation_date if count > 0
        end 
    end 

    def last_visit_updated 
        count = self.audits.count
        if self.audits.count == 0 
            self.last_visit_date 
        else 
            self.revision(count-1).last_visit_date 
        end 
    end 

    def next_treatment 
        arr = self.appointment 
        next_date = arr.sort.select{|a| a >= DateTime.now }  
        next_date.first
    end 

    def last_treatment 
        arr = self.appointment 
        last_date = arr.sort.select{|a| a <= DateTime.now }
        last_date.last  
    end 

    private 

    def patient_id 
        self.patient_number = self.id 
        self.save 
    end 
end
