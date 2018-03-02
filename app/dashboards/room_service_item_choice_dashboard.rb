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
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :title,
    :minimum_number_of_selections,
    :maximum_number_of_selections,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :title,
    :room_service_item_choice_options,
    :default_option,
    :minimum_number_of_selections,
    :maximum_number_of_selections,
    :room_service_items,
    :id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :room_service_item_choice_options,
    :default_option,
    :minimum_number_of_selections,
    :maximum_number_of_selections,
    :room_service_items,
  ].freeze

  # Overwrite this method to customize how room service item choices are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(room_service_item_choice)
    # TODO: Create an 'internal name' field and use that here.
    room_service_item_choice.title
  end
end
