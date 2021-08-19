# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    Visitor.create(ip_address: request.remote_ip)
    @pets = Pet.includes(:picture_attachment).by_name(params[:name]).published
    @races = Pet::RACE
  end

  def create
    pet = Pet.new(pet_params)
    if pet.save
      render json: pet, status: :ok
    else
      render json: pet.errors, status: :unprocessable_entity
    end
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :birth_date, :death_date, :race, :country, :picture)
    end
end
