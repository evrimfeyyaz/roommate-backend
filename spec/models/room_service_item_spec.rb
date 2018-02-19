require 'rails_helper'

describe RoomServiceItem do
  it { should validate_presence_of :title }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

  it { should have_many(:room_service_categories).through(:room_service_categories_items) }
  it { should have_many(:room_service_item_choices).through(:room_service_item_choices_items) }
  it { should have_many(:room_service_item_tags).through(:room_service_item_tags_items) }

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

  describe '#available_at_the_moment?' do
    it "is true when at least one of the item's categories is available at the moment" do
      available_category   = build(:room_service_category, :available_at_the_moment)
      unavailable_category = build(:room_service_category, :unavailable_at_the_moment)

      subject.room_service_categories = [available_category, unavailable_category]

      expect(subject.available_at_the_moment?).to be true
    end

    it "is false when all of the item's categories are unavailable at the moment" do
      unavailable_category1 = build(:room_service_category, :unavailable_at_the_moment)
      unavailable_category2 = build(:room_service_category, :unavailable_at_the_moment)

      subject.room_service_categories = [unavailable_category1, unavailable_category2]

      expect(subject.available_at_the_moment?).to be false
    end
  end
end
