Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :jobs do
    resources :contacts
    resources :document
    get :deleted_index, on: :collection
    member do
      get 'content'
      get 'content_edit'
      put :new_network
      patch :new_network
      put :new_interview
      patch :new_interview
    end
  end
end
