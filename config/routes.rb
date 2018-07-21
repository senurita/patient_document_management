Rails.application.routes.draw do


  devise_for :users

  root to: 'users#listing'

  get '/user' => 'users#show'

  match '/create_request' => 'users#create_request', via: [:patch, :put, :post], as: :users_create_request
  match '/approve_request' => 'users#approve_request', via: [:patch, :put, :post], as: :users_approve_request
  match '/deny_request' => 'users#deny_request', via: [:patch, :put, :post], as: :users_deny_request
  match '/view_document' => 'users#view_document', via: [:get], as: :users_view_document


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
