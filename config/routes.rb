Rails.application.routes.draw do
  root to: 'admin#index'

  # Admin Users
  devise_for :admin_users

  # GraphQL API
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
end
