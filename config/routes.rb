Rails.application.routes.draw do


  root :to => 'hub#index'
  get 'hub/index'

  get 'stores/index'
  get 'people/index'

end
