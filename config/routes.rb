Rails.application.routes.draw do
  devise_for :visitors
  #root to: 'books#index'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    root to: 'pages#home'

    resources :books
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/users', to: 'users#new'
    resources :users
    #match ':controller(/:action(/:id))(.:format)'
    resources :segments
  end
end
