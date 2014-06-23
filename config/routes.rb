Rails.application.routes.draw do



  root :to => 'hub#index'
  get 'hub/index'

  get 'settings/show'
  get 'stores/index'
  get 'people/index'
  get 'people/engineering'

end
