Rails.application.routes.draw do

  root 'homes#top'
  get 'about' => "homes#about"

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }



  devise_for :admins, skip: :all
  devise_scope :admin do
    get '/admin/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    post '/admin/sign_in', to: 'admins/sessions#create', as: :admin_session
    delete '/admin/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  namespace :admin do
    resources :items, except: [:destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
