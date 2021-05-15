require 'rails_helper'

RSpec.describe Visitor, type: :model do
  it { should validate_presence_of :ip_address }
end
