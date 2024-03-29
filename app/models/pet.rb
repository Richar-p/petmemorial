# frozen_string_literal: true

class Pet < ApplicationRecord

  RACE = %w[Chien Chat Furet Volatile Bovin Reptile Arachnide Amphibien Équidé Rongeur Lapin Poisson]

  has_one_attached :picture
  validates :name, :country, :race, :birth_date, :death_date, presence: true
  validates :country, inclusion: { in: ISO3166::Country.all.map(&:alpha2) }
  validates :race, inclusion: { in: RACE }
  validates :birth_date, date: { before: Proc.new { Time.now } }
  validates :death_date, date: { after: :birth_date, before: Proc.new { Time.now } }

  scope :published, -> { where("is_published = true") }
  scope :by_name, ->(name) { where("name LIKE ?", "%#{name}%") }


  def picture_url
    if picture.attached?
      Rails.application.routes.url_helpers.rails_blob_path(picture, only_path: true)
    else
      '/icon_background_white.png'
    end
  end
end
