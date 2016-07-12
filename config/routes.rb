Rails.application.routes.draw do
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
