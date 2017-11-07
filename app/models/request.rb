# Model for request within har file
class Request < ApplicationRecord
  belongs_to :har_file
  validates :method, presence: true, inclusion: { in: %w(HEAD GET POST PUT DELETE OPTIONS PATCH CONNECT)}
  validates :uri, presence: true
end
