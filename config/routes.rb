Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  get 'entrance/index'

  get 'users/dashboard'
  get 'users/settings'

  # post?
  # get 'users/reblog'
  # get 'users/like'
  # get 'users/configure'
  # get 'users/select_view_blog'
  # get 'users/select_action_blog'

  root 'entrance#index'
  get 'entrance', to: 'entrance#index', as: 'user_root'

end
