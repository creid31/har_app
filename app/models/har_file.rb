# Model for har file
class HarFile < ApplicationRecord
  mount_uploader :content, ContentUploader
  validates :name, presence: true, length: { in: 2..20 }
  has_many :requests, dependent: :destroy, validate: true
  validate :requests_required

  def requests_required
    errors.add :requests, 'A HAR file should have at least one request entry' if requests.blank?
  end
end
