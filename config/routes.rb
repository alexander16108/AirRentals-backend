Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
             resources :user do 
              resources :rents
            end
            resources :planes
            get '/member-data', to: 'members#show'
            get '/users', to: 'users#index' 
end
