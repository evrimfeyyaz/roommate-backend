Rails.application.routes.draw do
  root to: 'admin#index'

  # Admin
  devise_for :admins

  # GraphQL API
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
end
