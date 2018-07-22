Rails.application.routes.draw do


  devise_for :users
  resources :documents

  root to: 'users#listing'

  match '/create_request' => 'users#create_request', via: [:patch, :put, :post], as: :users_create_request
  match '/list_documents' => 'documents#list_documents', via: [:patch, :put, :post, :get], as: :documents_list_documents
  match '/approve_request' => 'users#approve_request', via: [:patch, :put, :post], as: :users_approve_request
  match '/deny_request' => 'users#deny_request', via: [:patch, :put, :post], as: :users_deny_request


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
