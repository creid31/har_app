Rails.application.routes.draw do
  resources :har_files do
    resources :requests, only: [:index]
    get '/requests/:index', to: 'requests#show', as: 'request_by_index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
