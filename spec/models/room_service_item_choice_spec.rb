require 'rails_helper'

describe RoomServiceItemChoice do
  it { should have_many(:room_service_items).through(:room_service_item_choices_items) }
  it { should have_many(:room_service_item_choice_options) }
  it { should belong_to(:default_option) }
  it { should allow_value(nil).for(:default_option) }

  it { should validate_presence_of :title }
  it { should validate_numericality_of(:minimum_number_of_selections).is_greater_than(0).only_integer }
  it { should allow_value(nil).for(:minimum_number_of_selections) }
  it { should allow_value(nil).for(:maximum_number_of_selections) }

  describe 'validate length of room service item choice options is minimum two' do
    it 'does not pass when there are less than two options' do
      subject.validate

      expect(subject.errors.details[:room_service_item_choice_options]).to include(error: :too_short, count: 2)
    end

    it 'passes when there are two or more options' do
      subject.room_service_item_choice_options << build_list(:room_service_item_choice_option, 2)

      subject.validate

      expect(subject).not_to have_validation_error_on(:room_service_item_choice_options)
                               .with_message_symbol(:too_short)
    end
  end

  describe 'validate maximum number of selections is greater than or equal to minimum' do
    it 'does not pass when maximum is less than minimum' do
      subject.minimum_number_of_selections = 3
      subject.maximum_number_of_selections = 2

      subject.validate

      expect(subject).to have_validation_error_on(:maximum_number_of_selections)
                           .with_message_symbol(:less_than_minimum)
                           .with_message_string("maximum number of selections can't be less than the minimum")
    end

    it 'passes when maximum is equal to minimum' do
      subject.minimum_number_of_selections = 1
      subject.maximum_number_of_selections = 1

      subject.validate

      expect(subject).not_to have_validation_error_on(:maximum_number_of_selections)
                               .with_message_symbol(:less_than_minimum)
                               .with_message_string("maximum number of selections can't be less than the minimum")
    end

    it 'passes when maximum is greater than minimum' do
      subject.minimum_number_of_selections = 2
      subject.maximum_number_of_selections = 3

      subject.validate

      expect(subject).not_to have_validation_error_on(:maximum_number_of_selections)
                               .with_message_symbol(:less_than_minimum)
                               .with_message_string("maximum number of selections can't be less than the minimum")
    end

    it 'passes when maximum is a number and minimum is nil' do
      subject.minimum_number_of_selections = nil
      subject.maximum_number_of_selections = 2

      subject.validate

      expect(subject).not_to have_validation_error_on(:maximum_number_of_selections)
                               .with_message_symbol(:less_than_minimum)
                               .with_message_string("maximum number of selections can't be less than the minimum")
    end

    context 'when maximum is nil' do
      it 'passes when minimum is nil' do
        subject.minimum_number_of_selections = nil
        subject.maximum_number_of_selections = nil

        subject.validate

        expect(subject).not_to have_validation_error_on(:maximum_number_of_selections)
                                 .with_message_symbol(:less_than_minimum)
                                 .with_message_string("maximum number of selections can't be less than the minimum")
      end

      it 'passes when minimum is a number' do
        subject.minimum_number_of_selections = 3
        subject.maximum_number_of_selections = nil

        subject.validate

        expect(subject).not_to have_validation_error_on(:maximum_number_of_selections)
                                 .with_message_symbol(:less_than_minimum)
                                 .with_message_string("maximum number of selections can't be less than the minimum")
      end
    end
  end
end
