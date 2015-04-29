Rails.application.routes.draw do
  #devise_for :admins

  #devise_scope :user do
  #  get "signup", to: "devise/registrations#new"
  #  get "login", to: "devise/sessions#new"
  #  get "logout", to: "devise/sessions#destroy"
  #end

    root 'centeral#index'
<<<<<<< HEAD
    	resources :courses
    	resources :students
    	resources :requirements
=======
    resources :courses
    resources :students
    resources :requirements
>>>>>>> 621ae2dd8f712aa2448e4dc77d7c0683909ddd5c
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
<<<<<<< HEAD

    devise_for :users do
      get "/users/sign_out" => 'sessions#destroy'
    end
=======
    #get "/users/sign_out" => 'sessions#destroy'
>>>>>>> 621ae2dd8f712aa2448e4dc77d7c0683909ddd5c
end
