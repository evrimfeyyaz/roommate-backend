class RoomServiceItem < ApplicationRecord
  acts_as_tenant :hotel

  mount_uploader :image, ItemImageUploader
  mount_uploader :thumbnail, ItemThumbnailUploader

  has_many :room_service_categories_items
  has_many :room_service_categories, through: :room_service_categories_items
  has_many :room_service_item_choices_items
  has_many :room_service_item_choices, through: :room_service_item_choices_items
  has_many :room_service_item_tags_items
  has_many :room_service_item_tags, through: :room_service_item_tags_items

  validates_presence_of :title
  validates_numericality_of :price, greater_than_or_equal_to: 0

  def image_1x
    return nil if image.blank?

    ActionController::Base.helpers.image_url(image.versions[:one_x].url)
  end

  def image_2x
    return nil if image.blank?

    ActionController::Base.helpers.image_url(image.versions[:two_x].url)
  end

  def thumbnail_1x
    return nil if thumbnail.blank?

    ActionController::Base.helpers.image_url(thumbnail.versions[:one_x].url)
  end

  def thumbnail_2x
    return nil if thumbnail.blank?

    ActionController::Base.helpers.image_url(thumbnail.versions[:two_x].url)
  end

  def available_at_the_moment?
    room_service_categories.any?(&:available_at_the_moment?)
  end
end