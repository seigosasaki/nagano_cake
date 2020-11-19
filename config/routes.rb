Rails.application.routes.draw do

  root 'homes#top'
  get 'about' => "homes#about"

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  scope module: :customer do
    resources :items, only: [:index, :show]

    get 'members/unsubscribe' => 'members#unsubscribe'
    patch 'members/withdraw' => 'members#withdraw'

    resource :members, only: [:show, :edit, :update]

    delete "cart_items/destroy_all" => 'cart_items#destroy_all', as: :cart_items_destroy_all
    resources :cart_items, only: [:index, :create, :update, :destroy]

    post 'orders/confirm' => 'orders#confirm', as: :orders_confirm
    get 'orders/complete' => 'orders#complete', as: :orders_complete
    resources :orders, only: [:index, :new, :create, :show]
  end



  get "admin" => "admin/homes#top"

  devise_for :admins, skip: :all
  devise_scope :admin do
    get '/admin/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    post '/admin/sign_in', to: 'admins/sessions#create', as: :admin_session
    delete '/admin/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  namespace :admin do
    resources :homes, only: []
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :personal]
    get 'orders/:id/personal' => 'orders#personal', as: :orders_personal


  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
