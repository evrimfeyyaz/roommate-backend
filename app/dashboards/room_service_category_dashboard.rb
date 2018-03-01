require "administrate/base_dashboard"

class RoomServiceCategoryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    hotel: Field::BelongsTo,
    room_service_categories_items: Field::HasMany,
    room_service_items: Field::HasMany,
    id: Field::String.with_options(searchable: false),
    title: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    available_from: Field::String,
    available_until: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :title,
    :room_service_items,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :title,
    :available_from,
    :available_until,
    :room_service_items,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :room_service_items,
    :title,
    :available_from,
    :available_until,
  ].freeze

  # Overwrite this method to customize how room service categories are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(room_service_category)
    room_service_category.title
  end
end
