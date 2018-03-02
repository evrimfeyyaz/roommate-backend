require "administrate/base_dashboard"

class RoomServiceItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    hotel: Field::BelongsTo,
    room_service_categories_items: Field::HasMany,
    room_service_categories: Field::HasMany,
    room_service_item_choices_items: Field::HasMany,
    room_service_item_choices: Field::HasMany,
    room_service_item_tags_items: Field::HasMany,
    room_service_item_tags: Field::HasMany,
    id: Field::String.with_options(searchable: false),
    title: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    price: Field::String.with_options(searchable: false),
    description: Field::Text,
    image: Field::Carrierwave.with_options(
      image: :one_x,
      image_on_index: false,
      remove: true
    ),
    thumbnail: Field::Carrierwave.with_options(
      image: :one_x,
      image_on_index: true,
      remove: true
    ),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :thumbnail,
    :title,
    :description,
    :price,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :title,
    :price,
    :description,
    :room_service_categories,
    :room_service_item_choices,
    :room_service_item_tags,
    :thumbnail,
    :image,
    :id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :price,
    :description,
    :room_service_categories,
    :room_service_item_choices,
    :room_service_item_tags,
    :image,
    :thumbnail,
  ].freeze

  # Overwrite this method to customize how room service items are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(room_service_item)
    room_service_item.title
  end

  def permitted_attributes
    super + [:remove_thumbnail, :remove_image]
  end
end
