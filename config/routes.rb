Rails.application.routes.draw do
    root 'centeral#index'
    resources :courses
    resources :students
    resources :requirements
end
