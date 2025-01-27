require "administrate/base_dashboard"

class StayDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::String.with_options(searchable: false),
    room_service_orders: Field::HasMany,
    room_number: Field::String,
    began_at: Field::DateTime,
    ended_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :room_number,
    :began_at,
    :ended_at,
    :room_service_orders,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :room_number,
    :began_at,
    :ended_at,
    :room_service_orders,
    :id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :room_number,
    :began_at,
    :ended_at,
  ].freeze

  # Overwrite this method to customize how stays are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(stay)
  #   "Stay ##{stay.id}"
  # end
end
