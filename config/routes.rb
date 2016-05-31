Rails.application.routes.draw do
  resources :files, only: [:index, :show] do
    member do
      get 'contents'
    end
  end
end
