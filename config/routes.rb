Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  # delete 'posts/:id', to: 'posts#des'
  resources :posts 
  resources :users, only: :show
end
