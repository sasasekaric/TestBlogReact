Rails.application.routes.draw do

  root to: "posts#index"

  devise_for :users

  resources :posts
  match 'my_posts', to: 'posts#my_posts', as: 'my_posts', via: :get

end
