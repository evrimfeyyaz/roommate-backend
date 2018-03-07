require "administrate/base_dashboard"

class RoomServiceOrderDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    hotel: Field::BelongsTo,
    room_service_cart_items: Field::HasMany,
    stay: Field::BelongsTo,
    id: Field::String.with_options(searchable: false),
    special_request: Field::String,
    payment_option: EnumField,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :stay,
    :special_request,
    :payment_option,
    :room_service_cart_items,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :stay,
    :room_service_cart_items,
    :special_request,
    :payment_option,
    :id,
    :created_at,
    :updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :room_service_cart_items,
    :special_request,
    :payment_option,
  ].freeze

  # Overwrite this method to customize how room service orders are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(room_service_order)
    "Order ##{room_service_order.id}"
  end
end
