class Visitor < ApplicationRecord
  validates :ip_address, presence: true
end
