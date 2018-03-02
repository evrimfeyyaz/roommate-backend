require "administrate/base_dashboard"

class RoomServiceCartItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    hotel: Field::BelongsTo,
    room_service_order: Field::BelongsTo,
    room_service_item: Field::BelongsTo,
    room_service_cart_items_item_choice_options: Field::HasMany,
    selected_options: Field::HasMany.with_options(class_name: "RoomServiceItemChoiceOption"),
    id: Field::String.with_options(searchable: false),
    quantity: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :hotel,
    :room_service_order,
    :room_service_item,
    :room_service_cart_items_item_choice_options,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :hotel,
    :room_service_order,
    :room_service_item,
    :room_service_cart_items_item_choice_options,
    :selected_options,
    :id,
    :quantity,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :hotel,
    :room_service_order,
    :room_service_item,
    :room_service_cart_items_item_choice_options,
    :selected_options,
    :quantity,
  ].freeze

  # Overwrite this method to customize how room service cart items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(room_service_cart_item)
  #   "RoomServiceCartItem ##{room_service_cart_item.id}"
  # end
end
