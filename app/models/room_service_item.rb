class RoomServiceItem < ApplicationRecord
  mount_uploader :image, ItemImageUploader
  mount_uploader :thumbnail, ItemThumbnailUploader

  has_many :room_service_categories_items
  has_many :room_service_categories, through: :room_service_categories_items

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
end