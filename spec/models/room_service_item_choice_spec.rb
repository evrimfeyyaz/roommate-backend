require 'rails_helper'

describe RoomServiceItemChoice do
  it { should have_many(:room_service_items).through(:room_service_item_choices_items) }
  it { should have_many(:room_service_item_choice_options) }
  it { should belong_to(:default_option) }

  it { should validate_presence_of :title }
  it { should_not allow_value(nil).for(:allows_multiple_selections) }
  it { should_not allow_value(nil).for(:optional) }

  describe '#optional' do
    it 'has a default value of "true"' do
      expect(subject.optional).to eq(true)
    end
  end

  describe '#allows_multiple_selections' do
    it 'has a default value of "true"' do
      expect(subject.allows_multiple_selections).to eq(false)
    end
  end

  describe 'has at least two options validation' do
    it 'is not valid when it has less than two options' do
      subject.validate

      expect(subject.errors.details[:room_service_item_choice_options]).to include(error: :too_short, count: 2)
    end

    it 'is valid when it has two or more options' do
      subject.room_service_item_choice_options << build_list(:room_service_item_choice_option, 2)

      subject.validate

      expect(subject.errors.details[:room_service_item_choice_options]).to be_empty
    end
  end
end
