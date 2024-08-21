# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  mount GoodJob::Engine => 'good_job'

  get 'auth/:token', to: 'auth#create', as: :auth
  resource :sessions, only: %i[new create destroy]
  resources :images, only: %i[index new create edit update destroy] do
    resources :image_descriptions, only: %i[create]
  end

  root 'images#index'
end
