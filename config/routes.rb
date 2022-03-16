# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root  "home#index"
  post  "/addpet", to: "home#create"
  get   "/switch_theme", to: "home#switch_theme"
  get   "/:id", to: "home#show"
end
