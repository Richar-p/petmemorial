class PetSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :name, :country, :race, :birth_date, :death_date, :picture_url

  def picture_url
    Rails.application.routes.url_helpers.rails_blob_path(object.picture, only_path: true) if object.picture.attached?
  end
end
