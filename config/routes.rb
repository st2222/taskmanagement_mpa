Rails.application.routes.draw do
  get 'users/show'
  get 'users/search/', to: 'users#search', as: 'users_search'
  post 'friends/request/', to: 'friends#friend_request'
  get 'friends/', to: 'friends#index'
  get 'friends/requested_list', to: 'friends#requested_list'
  get 'friends/request_list', to: 'friends#request_list'
  put 'friends/:from_friend_id/:to_friend_id', to: 'friends#approve', as: 'friend'
  get 'tasks/list', to: 'tasks#list'
  devise_for :users
  root to: 'tasks#index'
  resources :tasks
  resources :task_branches

  

  # ログイン、アカウント編集後、任意のページに推移させるための記述
  #devise_for :users, controllers: {
  #  registrations: 'users/registrations'
  #}
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
end
