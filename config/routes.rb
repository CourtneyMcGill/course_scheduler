Rails.application.routes.draw do
  #devise_for :admins

  #devise_scope :user do
  #  get "signup", to: "devise/registrations#new"
  #  get "login", to: "devise/sessions#new"
  #  get "logout", to: "devise/sessions#destroy"
  #end

    root 'centeral#index'
    resources :courses
    resources :students
    resources :requirements
    resources :courses do
	resources :students
	resources :requirements
    end
    resources :students do
	resources :courses
    end
    resources :requirements do
	resources :students
    end
    devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks" }	
    get "/auth/:provider/callback" => 'sessions#create'
    #get "/users/sign_out" => 'sessions#destroy'
  
end
