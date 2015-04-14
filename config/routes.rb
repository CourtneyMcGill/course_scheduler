Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers:
    { omniauth_callbacks: "omniauth_callbacks" }
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
