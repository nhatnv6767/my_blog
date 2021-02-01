Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  # thêm các routes cho articles
  resources :articles, only: [:show, :index]
end
