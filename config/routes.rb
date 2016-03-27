Rails.application.routes.draw do


  root to: "posts#index"

  devise_for :users

  resources :posts do
    collection do
      patch 'search'
      get 'my_posts', as: 'my'
    end
  end

  match '/react', to: 'welcome#index', as: 'react', via: :get

end
