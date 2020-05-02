Rails.application.routes.draw do
  resources :question_answers do
    resources :question_option_selections
  end
  resources :surveys do
     resources :questions do
       resources :question_options
     end
  end
  post 'surveys/:id', to: 'surveys#surveyReact'
  root 'home#home'
  get 'home/contact'
  get 'home/stream_test'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
