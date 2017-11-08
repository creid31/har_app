# Model for request within har file
class Request < ApplicationRecord
  belongs_to :har_file
  validates :method, presence: true,
                     inclusion: {
                       in: %w(HEAD GET POST PUT DELETE OPTIONS PATCH CONNECT),
                       message: 'Method for request must be present and be a valid method'
                     }
  validates :uri, presence: { message: 'URL for request must be present' }
end
