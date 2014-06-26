Rails.application.routes.draw do



  root :to => 'hub#index'
  get 'hub/index'

  get 'settings/show'
  get 'stores/index'
  get 'people/index'
  get 'people/engineering'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/login' => 'sessions#new', :as => :login
  get '/logout' => 'sessions#destroy', :as => nil
  delete '/logout' => 'sessions#destroy', :as => :logout
  get '/auth/failure' => 'sessions#failure'

end
