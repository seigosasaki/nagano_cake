Rails.application.routes.draw do
  scope module: :public do
  root 'homes#top'
  get 'about' => "homes#about"

  devise_for :customers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
