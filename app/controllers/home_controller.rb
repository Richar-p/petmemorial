# frozen_string_literal: true

class HomeController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :show

  def index
    Visitor.create(ip_address: request.remote_ip)
    @pets = Pet.by_name(params[:name]).published.select(:id, :name, :race, :country)
    @races = Pet::RACE
  end

  def show
    render json: Pet.includes(:picture_attachment).find(params[:id]), serializer: PetSerializer
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
