Rails.application.routes.draw do
  resources :guests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login/auth'
  post 'login/auth'

  get 'admins/menu'

  get 'reservations/list'

  resources :admins
  resources :reservations
end
