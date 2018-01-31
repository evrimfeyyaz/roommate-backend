require 'rails_helper'

describe RoomServiceItem do
  it { should validate_presence_of :title }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

  it { should have_many(:room_service_categories).through(:room_service_categories_items) }

  describe '#image_1x and #image_2x' do
    it 'should return the URL for the image with the scale of 1x and 2x' do
      item = build(:room_service_item, :with_image)

      image_1x_url = ActionController::Base.helpers.image_url(item.image.versions[:one_x].url)
      image_2x_url = ActionController::Base.helpers.image_url(item.image.versions[:two_x].url)

      expect(item.image_1x).to eq(image_1x_url)
      expect(item.image_2x).to eq(image_2x_url)
    end

    it 'should return nil when the item does not have an image' do
      item = build(:room_service_item)

      expect(item.image_1x).to be_nil
      expect(item.image_2x).to be_nil
    end
  end

  describe '#thumbnail_1x and #thumbnail_2x' do
    it 'should return the URL for the thumbnail with the scale of 1x and 2x' do
      item = build(:room_service_item, :with_thumbnail)

      thumbnail_1x_url = ActionController::Base.helpers.image_url(item.thumbnail.versions[:one_x].url)
      thumbnail_2x_url = ActionController::Base.helpers.image_url(item.thumbnail.versions[:two_x].url)

      expect(item.thumbnail_1x).to eq(thumbnail_1x_url)
      expect(item.thumbnail_2x).to eq(thumbnail_2x_url)
    end

    it 'should return nil when the item does not have a thumbnail' do
      item = build(:room_service_item)

      expect(item.thumbnail_1x).to be_nil
      expect(item.thumbnail_2x).to be_nil
    end
  end
end
