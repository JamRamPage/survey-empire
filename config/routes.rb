Rails.application.routes.draw do
  resources :question_answers
  resources :questions
  resources :surveys
  root 'home#home'
  get 'home/contact'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
