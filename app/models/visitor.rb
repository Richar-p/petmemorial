# frozen_string_literal: true

class Visitor < ApplicationRecord
  validates :ip_address, presence: true
end
