# frozen_string_literal: true

Rails.application.routes.draw do
  resources :dashboard, only: %i[index]
  resources :exports, only: %i[index create destroy]
  resources :orders, only: %i[index show]

  root 'dashboard#index'
end
