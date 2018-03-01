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

  # Hotel Admin
  namespace :hotel_admin do
    root to: 'room_service_categories#index'

    resources :room_service_cart_items
    resources :room_service_cart_items_item_choice_options
    resources :room_service_categories_items
    resources :room_service_categories
    resources :room_service_items
    resources :room_service_item_choices
    resources :room_service_item_choice_options
    resources :room_service_item_choices_items
    resources :room_service_item_tags
    resources :room_service_item_tags_items
    resources :room_service_orders
  end

  # GraphQL API
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
end
