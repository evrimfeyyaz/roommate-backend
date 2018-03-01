require "administrate/base_dashboard"

class RoomServiceItemChoiceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    hotel: Field::BelongsTo,
    room_service_item_choices_items: Field::HasMany,
    room_service_items: Field::HasMany,
    room_service_item_choice_options: Field::HasMany,
    default_option: Field::BelongsTo.with_options(class_name: "RoomServiceItemChoiceOption"),
    id: Field::String.with_options(searchable: false),
    title: Field::String,
    minimum_number_of_selections: Field::Number,
    maximum_number_of_selections: Field::Number,
    default_option_id: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :hotel,
    :room_service_item_choices_items,
    :room_service_items,
    :room_service_item_choice_options,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :hotel,
    :room_service_item_choices_items,
    :room_service_items,
    :room_service_item_choice_options,
    :default_option,
    :id,
    :title,
    :minimum_number_of_selections,
    :maximum_number_of_selections,
    :default_option_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :hotel,
    :room_service_item_choices_items,
    :room_service_items,
    :room_service_item_choice_options,
    :default_option,
    :title,
    :minimum_number_of_selections,
    :maximum_number_of_selections,
    :default_option_id,
  ].freeze

  # Overwrite this method to customize how room service item choices are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(room_service_item_choice)
  #   "RoomServiceItemChoice ##{room_service_item_choice.id}"
  # end
end
