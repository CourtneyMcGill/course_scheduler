Rails.application.routes.draw do
    root 'students#index'
    resources :courses
    resources :students
    resources :requirements
end
