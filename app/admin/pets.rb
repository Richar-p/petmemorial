# frozen_string_literal: true

ActiveAdmin.register Pet do
  actions :all, except: [:create, :new]

  scope :all, default: true
  scope("Need validation") { |pet| pet.where(is_published: false) }

  action_item :publish, only: %i[show] do
    link_to("Rendre public", make_public_admin_pet_path(pet), method: :put) unless pet.is_published
  end

  member_action :make_public, method: :put do
    pet = Pet.find(params[:id])
    pet.update(is_published: true)
    redirect_to admin_pet_path(pet)
  end

  action_item :unpublish, only: %i[show] do
    link_to("Rendre privé", make_private_admin_pet_path(pet), method: :put) if pet.is_published
  end

  member_action :make_private, method: :put do
    pet = Pet.find(params[:id])
    pet.update(is_published: false)
    redirect_to admin_pet_path(pet)
  end

  permit_params :country, :name, :birth_date, :death_date, :race, :is_published

  show do
    attributes_table do
      row :name
      row :birth_date
      row :death_date
      row :race
      row :country
      row :is_published
      row :picture do |ad|
        image_tag ad.picture, style: "width: 100%;" if ad.picture.present?
      end
    end
    active_admin_comments
  end
end
