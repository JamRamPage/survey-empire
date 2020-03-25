Rails.application.routes.draw do
  resources :question_option_selections
  resources :question_options
  resources :question_answers
  resources :surveys do
	  resources :questions
  end
  root 'home#home'
  get 'home/contact'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
