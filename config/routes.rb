Rails.application.routes.draw do
  match 'events', to: 'events#create', via: :all

  resources :profiles

  resources :devices

  resources :directories, only: [:index, :show] do
    member do
      get 'files'
    end
  end

  resources :files, only: [:index, :show] do
    member do
      get 'contents'
    end
  end
end
