Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :shares
  root 'shares#index'

  get 'shares/:id' => 'shares#show'
  patch 'shares/:id' => 'shares#update'
  delete 'tweets/:id' => 'tweets#destroy'
  get 'shares/:id/edit' => 'shares#edit'

end
