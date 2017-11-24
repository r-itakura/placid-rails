Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login/auth'
  post 'login/auth'

  get 'admins/menu'
  get 'admins/logout'

  get 'reservations/list'
  get 'reservations/cancel'

  get 'placid_top/index'

  get 'search/list'

  resources :admins
  resources :hotels
  resources :plans
  resources :guests
  resources :rooms
  resources :reservations
end
