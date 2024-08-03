# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :images, only: %i[index new create edit update destroy] do
    resources :image_descriptions, only: %i[create]
  end

  root 'images#index'
end
