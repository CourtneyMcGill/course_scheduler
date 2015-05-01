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
    resources :courses
    resources :students do
	resources :courses, :controller=> 'student_courses', :only=>[:create,:destroy,:index]
        resources :requirements, :controller=> 'student_requirements', :only=>[:create,:destroy,:index]
    end
    resources :requirements

    devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks" }	
    get "/auth/:provider/callback" => 'sessions#create'
    get "/users/sign_out" => "omniauth_callbacks#logout"

	namespace :planner do
		resources :students
	end

    #devise_for :users do
    #  get "/users/sign_out" => 'sessions#destroy'
    #end
    #get "/users/sign_out" => 'sessions#destroy'
end
