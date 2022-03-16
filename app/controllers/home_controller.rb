# frozen_string_literal: true

class HomeController < ApplicationController

  skip_before_action  :verify_authenticity_token, only: :show
  before_action       :check_theme

  def index
    @theme = cookies[:theme] ||= 'dark'
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

  def switch_theme
    cookies[:theme] = (cookies[:theme] ||= 'dark') == 'dark' ? 'white' : 'dark'
    redirect_to root_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :birth_date, :death_date, :race, :country, :picture)
  end

  def check_theme
    @theme = cookies[:theme] ||= 'dark'
  end

end
