# frozen_string_literal: true

class Visitor < ApplicationRecord
  validates :ip_address, presence: true

  scope :today, -> { where(created_at: Period.new(Date.today..)) }
end
