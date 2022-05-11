Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
             resources :user, only: [:index] do 
              resources :reservations
            end
            resources :planes, only: [:index, :show, :create, :destroy] 
            get '/member-data', to: 'members#show'
            get '/users', to: 'users#index' 
end
