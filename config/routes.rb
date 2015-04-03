Rails.application.routes.draw do
    root 'centeral#index'
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
end
