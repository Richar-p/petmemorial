require 'rails_helper'

RSpec.describe Pet, type: :model do
  subject { create :pet }
  it { should validate_presence_of :name }
  it { should validate_presence_of :country }
  it { should validate_presence_of :race }
  it { should validate_presence_of :birth_date }
  it { should validate_presence_of :death_date }
  it { should validate_inclusion_of(:race).in_array(Pet::RACE) }
  it { should validate_inclusion_of(:country).in_array(ISO3166::Country.all.map(&:alpha2)) }
  it { should have_one_attached :picture }
end
