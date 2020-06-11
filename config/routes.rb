Rails.application.routes.draw do 
  resources :blogs
  get 'blogs/destroy/:id' => 'blogs#destroy'
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  post 'users/update'
  get 'users/create'
  post 'users/store'
  get 'users/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
