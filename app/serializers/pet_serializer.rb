class PetSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :name, :country, :race, :birth_date, :death_date, :picture_url

  def picture_url
    object.picture_url
  end
end
