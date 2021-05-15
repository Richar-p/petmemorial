require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
end
