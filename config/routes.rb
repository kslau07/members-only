Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: %i[new create index]
  resources :likes # , only: %i[create destroy]          # TODO: restrict routes to create and destroy

   root 'posts#index'
end
