class ClinicIp < ApplicationRecord
  belongs_to :clinic
  def self.ransackable_attributes(auth_object = nil)
    ["clinic_id", "created_at", "id", "ip", "last_login", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["clinic"]
  end
end
