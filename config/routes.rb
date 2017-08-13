Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(show create update) do
  	get '/visits', action: :visits, on: :member
    post '/new', action: :create, on: :collection 
  end
  resources :locations, only: %i(show create update) do
  	get '/avg', action: :avg, on: :member
    post '/new', action: :create, on: :collection 
  end
  resources :visits, only: %i(show create update) do
    post '/new', action: :create, on: :collection 
  end
end
