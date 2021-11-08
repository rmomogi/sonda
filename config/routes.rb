# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'

  namespace :v1 do
    namespace :sonda do
      root action: :index
      post :move
      get :show
    end
  end
end
