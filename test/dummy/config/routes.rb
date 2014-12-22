Rails.application.routes.draw do
  root to: redirect('/login')
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resource :landing, only: [:show]
end
