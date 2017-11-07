Rails.application.routes.draw do
  resources :har_files do
    resources :requests, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
