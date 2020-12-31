Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books do
    member do
      post 'mood_create'
    end
  end
  resources :users, only: :show
  resources :searchs, only: [:index] do
    collection do
      get  'mood_text_search', 'keyword_text_search', 'mood_search', 'keyword_search', 'ccode_search'
    end
  end
end
