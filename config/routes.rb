Rails.application.routes.draw do

    root 'centeral#index'
    	resources :courses
    	resources :students
    	resources :requirements
    resources :courses
    resources :students do
	resources :courses, :controller=> 'student_courses', :only=>[:create,:destroy,:index]
        resources :requirements, :controller=> 'student_requirements', :only=>[:create,:destroy,:index]
    end
    resources :requirements do
        resources :courses, :controller=> 'requirement_courses', :only=>[:create,:destroy,:index]
    end


	namespace :planner do
		resources :students
	end


    devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks" }
    devise_scope :user do
	get "/auth/:provider/callback" => 'devise/sessions#create'
        get "/users/sign_out" => 'devise/sessions#destroy'
    end
end
