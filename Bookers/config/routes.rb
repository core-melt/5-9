Rails.application.routes.draw do
  devise_for :users

  get 'home' => 'homes#top'
  get 'home/about'  => 'homes#about'
  root 'homes#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update]
end
