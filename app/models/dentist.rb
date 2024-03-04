class Dentist < StaffInfo
    has_many :patients 
    has_many :dentist_aggregations
    validates :first_name, :last_name ,presence: true
    has_many :counselings 

    def full_name 
        self.last_name  + "  " + self.first_name
    end 
end
