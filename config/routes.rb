Rails.application.routes.draw do



  root :to => 'hub#index'
  resources :stores

  get 'hub/index'

  get 'settings/show'
  get 'people/index'
  get 'people/engineering'
  get 'people/graphic_design'
  get 'people/sales_team'
  get 'people/customer_support_team'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/login' => 'sessions#new', :as => :login
  get '/logout' => 'sessions#destroy', :as => nil
  delete '/logout' => 'sessions#destroy', :as => :logout
  get '/auth/failure' => 'sessions#failure'

end
