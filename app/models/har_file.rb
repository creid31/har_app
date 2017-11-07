# Model for har file
class HarFile < ApplicationRecord
  mount_uploader :content, ContentUploader
  validates :name, presence: true, length: { in: 2..20 }
  has_many :requests
  validates_associated :requests
end
