class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validate :acceptable_image 
  attribute :current_password
  has_one_attached :logo, dependent: :destroy
  has_many_attached :documents, dependent: :destroy
  has_one :clinic, dependent: :destroy
  accepts_nested_attributes_for :clinic
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :masqueradable

  enum role: { Administrator: 'Administrator', Manager: 'Manager', ClinicUser: "ClinicUser"}, _default: " "
  enum usage: { '利用中': 'In Use', '利用停止': 'Not In Use'}, _default: " "

  after_initialize :set_default_role, :if => :new_record? 
              
  def set_default_role
    self.role ||= :Administrator
  end

  def is_admin? 
    self.role == "Administrator"
  end 

  def full_name 
    if self.first_name.present? && self.last_name.present? 
      self.first_name + " " + self.last_name
    end 
  end 

  private 

  def acceptable_image
    return unless logo.attached?
  
    unless logo.byte_size <= 1.megabyte
      errors.add(:logo, "is too big")
    end
  
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(logo.content_type)
      errors.add(:logo, "must be a JPEG or PNG")
    end
  end

end
