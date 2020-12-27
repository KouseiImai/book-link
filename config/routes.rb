Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: :show
  resources :searchs, only: [:index] do
    collection do
      get  'mood_search', 'keyword_search', 'ccode_search', 'search'
    end
  end
end
