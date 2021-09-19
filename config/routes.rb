Rails.application.routes.draw do


scope module: :public do
root to: 'homes#top'
get 'home/about' => 'homes#about'

get '/items' => 'items#index'
get '/itmes/:id' => 'items#show'

get '/customers' => 'customers#show'
get '/cutomers/edit' => 'customers#edit'
patch '/customers' => 'customers#update'
get '/customers/unsubscribe' => 'customers#unsubscribe'
patch '/customers/withdraw' => 'customers#withdraw'

get '/cart_items' => 'cart_items#index'
patch '/cart_items/:id' => 'cart_items#update'
delete '/cart_items/:id' => 'cart_items#destroy'
delete '/cart_items/destroy_all' => 'cart_items#destroy_all'

get '/orders/new' => 'orders#new'
get '/orders/order_confirm' => 'orders#order_confirm'
get '/orders/order_complete' => 'orders#order_complete'
post '/orders/create' => 'orders#create'
get '/orders' => 'orders#index'
get '/orders/:id' => 'orders#show'

get '/addresses' => 'addresses#index'
get '/addresses/:id/edit' => 'addresses#edit'
post '/addresses' =>'addresses#create'
patch '/addresses/:id' => 'addresses#update'
delete '/addresses/:id' => 'addresses#destroy'

end


devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}



 namespace :admin do
   resources :customers
   resources :genres
   resources :items
  resources :orders
  resources :order_items
 end


  resources :addresses
  resources :admins
  resources :cart_items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
