Fei::Application.routes.draw do
  resources :users, only: [:new, :create, :show]

  root 'pages#index'
end
