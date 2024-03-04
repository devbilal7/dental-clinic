class DentistAggregation < ApplicationRecord
    belongs_to :clinic
    belongs_to :dentist 

    def actual_visitors 
        begin  
            self.no_of_reservations - (self.no_of_cancellations + self.no_notice_cancellations) - self.people_returning_home
        rescue 
            nil 
        end 
    end 
end
