require "administrate/base_dashboard"

class RoomServiceItemTagsItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    room_service_item_tag: Field::BelongsTo,
    room_service_item: Field::BelongsTo,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :room_service_item_tag,
    :room_service_item,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :room_service_item_tag,
    :room_service_item,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :room_service_item_tag,
    :room_service_item,
  ].freeze

  # Overwrite this method to customize how room service item tags items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(room_service_item_tags_item)
  #   "RoomServiceItemTagsItem ##{room_service_item_tags_item.id}"
  # end
end
