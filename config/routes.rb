Rails.application.routes.draw do
  get  "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  resources :sessions, only: [ :index, :show, :destroy ]
  resource  :password, only: [ :edit, :update ]
  namespace :identity do
    resource :email,              only: [ :edit, :update ]
    resource :email_verification, only: [ :show, :create ]
    resource :password_reset,     only: [ :new, :edit, :create, :update ]
  end
  mount SolidusAdmin::Engine, at: "/admin", constraints: ->(req) {
    req.cookies["solidus_admin"] != "false" &&
    req.params["solidus_admin"] != "false"
  }
  # This line mounts Solidus's routes at the root of your application.
  #
  # Unless you manually picked only a subset of Solidus components, this will mount routes for:
  #   - solidus_backend
  #   - solidus_api
  # This means, any requests to URLs such as /admin/products, will go to Spree::Admin::ProductsController.
  #
  # If you are using the Starter Frontend as your frontend, be aware that all the storefront routes are defined
  # separately in this file and are not part of the Solidus::Core::Engine engine.
  #
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  # We ask that you don't use the :as option here, as Solidus relies on it being the default of "spree"
  mount Spree::Core::Engine, at: "/"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"
end
