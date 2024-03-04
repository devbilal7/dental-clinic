class DentistHygienist < StaffInfo
    has_many :patients 
    validates :first_name, :last_name, presence: true
    has_many :dh_aggregations

    def full_name 
        self.last_name + "  " + self.first_name
    end 
end
