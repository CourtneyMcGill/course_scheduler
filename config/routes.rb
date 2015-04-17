Rails.application.routes.draw do
  #devise_for :admins

  devise_for :users, controllers:
    { omniauth_callbacks: "omniauth_callbacks" }	

  #devise_scope :user do
  #  get "signup", to: "devise/registrations#new"
  #  get "login", to: "devise/sessions#new"
  #  get "logout", to: "devise/sessions#destroy"
  #end

    root 'centeral#index'
    resources :courses
    resources :students
    resources :requirements
end
