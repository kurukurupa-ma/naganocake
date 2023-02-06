Rails.application.routes.draw do
  
  
  #devise_for :admins
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  #devise_for :customers
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  namespace :admin do
    root to: "homes#top"
    
    resources :items,only: [:index, :new, :create, :show, :edit, :update]
    
    resources :genres,only: [:index, :create, :edit, :update]
    
    resources :customers,only: [:index, :show, :edit, :update, :destroy]
    
    resources :orders,only: [:show, :update]
    
    resources :order_details,only: [:update]
  end
  
  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :items,only: [:index, :show]
    
    delete 'customers/sign_out'=> 'customers#destroy'
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    
    resources :cart_items,only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    
    resources :orders,only: [:new, :create, :index, :show]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
