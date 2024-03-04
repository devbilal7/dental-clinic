class StaffInfo < ApplicationRecord
    belongs_to :clinic
    validates :staff_code, :first_name, :last_name, :sex, :usage_classification, :hire_date, presence: true
    validates_uniqueness_of :staff_code
    enum sex: { "男性": "male","女性": "female" }
    enum job_type: { 
                        "歯科医師": "Dentist", 
                        "歯科衛生士": "DentistHygienist", 
                        "歯科技工士": "DentalTechnician",
                        "歯科助手": "Dental_assistant",
                        "トリートメントコーディネーター": "TreatmentCoordinator",
                        "診療放射線技師": "Radiological technologist",
                        "受付": "reception",
                        "事務": "Office work",
                        "滅菌": "Sterilization",
                        "コールセンター": "Call center"

                    }

    def full_name 
        self.last_name + "  " + self.first_name
    end 
end
