Rails.application.routes.draw do
  resources :question_answers do
    resources :question_option_selections
  end
  resources :surveys do
     resources :questions do
       resources :question_options
     end
  end

  resources :surveys do
    member do
      get :share
    end
  end
  root 'home#home'
  get 'home/contact'
  devise_for :users, controllers: {sessions: "sessions"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback', to: 'twitter_sessions#create'
  delete '/twitter_logout', to: 'twitter_sessions#destroy'
end
