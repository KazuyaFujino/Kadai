Rails.application.routes.draw do
	
  devise_for :accounts
  get 'diary/index'
  get 'diary',to: 'diary#index'

  get 'diary/add'
  post 'diary/add',to: 'diary#create'

  get 'diary/edit/:id', to: 'diary#edit'
  post 'diary/edit/:id', to: 'diary#update'

  patch 'diary/edit/:id', to:'diary#update'

  get 'diary/delete/:id',to:'diary#delete'

  get 'diary/find'
  post 'diary/find'

  get 'diary/:id',to: 'diary#show'

  get 'hello/login_check'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
