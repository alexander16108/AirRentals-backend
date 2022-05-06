Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
             resources :user do 
              resources :reservations
            end
            resources :planes
            get '/member-data', to: 'members#show'
            get '/users', to: 'users#index' 
end
