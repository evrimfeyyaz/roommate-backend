require "administrate/base_dashboard"

class RoomServiceItemChoiceOptionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    hotel: Field::BelongsTo,
    room_service_item_choice: Field::BelongsTo,
    id: Field::String.with_options(searchable: false),
    title: Field::String,
    price: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :hotel,
    :room_service_item_choice,
    :id,
    :title,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :hotel,
    :room_service_item_choice,
    :id,
    :title,
    :price,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :hotel,
    :room_service_item_choice,
    :title,
    :price,
  ].freeze

  # Overwrite this method to customize how room service item choice options are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(room_service_item_choice_option)
  #   "RoomServiceItemChoiceOption ##{room_service_item_choice_option.id}"
  # end
end
