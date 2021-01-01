Rails.application.routes.draw do
  root to: 'books#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope  :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end


  resources :books do
    member do
      post 'mood_create'
    end
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :searchs, only: [:index] do
    collection do
      get  'mood_text_search', 'keyword_text_search', 'mood_search', 'keyword_search', 'ccode_search'
    end
  end
end
