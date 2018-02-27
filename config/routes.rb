Rails.application.routes.draw do
  root to: 'admin/hotels#index'

  # Admin Users
  devise_for :admin_users

  # Admin
  namespace :admin do
    root to: 'hotels#index'

    resources :admin_users
    resources :hotels
  end

  # GraphQL API
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
end
