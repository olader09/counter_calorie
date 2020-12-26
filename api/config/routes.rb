Rails.application.routes.draw do
  post :user_token, to: 'user_token#create'
  resource :user
  
  resource :list do
    post :add, on: :member
    delete :remove, on: :member
  end

  resources :products
end
