class TreatmentCoordinator < StaffInfo
    has_many :patients
    
    def full_name 
        self.last_name  + "  " + self.first_name
    end
end
