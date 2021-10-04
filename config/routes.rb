Rails.application.routes.draw do

root to: 'public/homes#top'

devise_scope :customer do
  get '/customers/sign_up', to: 'customers/registrations#new'
  post '/customers', to: 'customers/registrations#create'

  get '/customers/sign_in', to: 'customers/sessions#new'
  post '/customers/sign_in', to: 'customers/sessions#create'
  delete '/customers/sign_out', to: 'customers/sessions#destroy'
end


devise_for :customers, skip: [:registrations, :sessions, :passwords]

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

scope module: :public do

get 'home/about' => 'homes#about'

resources :items, only: [:index, :show]
#get '/items' => 'items#index'
#get '/items/:id' => 'items#show'

#get '/customers/edit' => 'customers#edit'
#patch '/customers' => 'customers#update'
#get '/customers' => 'customers#show'
get '/customers/unsubscribe' => 'customers#unsubscribe'
patch '/customers/withdraw' => 'customers#withdraw'
resource :customers, only: [:show, :edit, :update]

delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
resources :cart_items, except: [:show, :edit, :new]

get '/orders/confirm' => 'orders#confirm'
get '/orders/complete' => 'orders#complete'
resources :orders
#post '/orders' => 'orders#create'
#get '/orders' => 'orders#index'
#get '/orders/:id' => 'orders#show'
#get '/orders/new' => 'orders#new'

#get '/addresses' => 'addresses#index'
#get '/addresses/:id/edit' => 'addresses#edit'
#post '/addresses' =>'addresses#create'
#patch '/addresses/:id' => 'addresses#update'
#delete '/addresses/:id' => 'addresses#destroy'

resources :addresses

end




 namespace :admin do
  resources :customers
  resources :genres
  resources :items
  resources :orders
  resources :order_items
 end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
