class VersionControl < ApplicationRecord
  belongs_to :user

  has_one_attached :document, dependent: :destroy
end
