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
  get 'surveys/:id?analyse=true', to: 'surveys#survey_analytics'
  #get 'surveys/survey_analytics'
  root 'home#home'
  get 'home/contact'
  get 'home/about'
  devise_for :users
  #UNCOMMENT BELOW to stream the homepage
  get 'home/stream_test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '*path' => redirect('/'), via: :all
end
