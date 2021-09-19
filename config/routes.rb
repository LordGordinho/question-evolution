Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      resources :answers
      resources :options
      resources :questions
      resources :roles
      resources :subjects
      resources :users
    end
  end
end
