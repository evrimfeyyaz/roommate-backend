require 'rails_helper'

describe RoomServiceCartItem do
  it_behaves_like 'a tenant model'

  it { should belong_to(:room_service_order) }
  it { should belong_to(:room_service_item) }
  it { should belong_to(:hotel) }
  it { should have_many(:selected_options) }

  it { should validate_numericality_of(:quantity).is_greater_than(0).only_integer }

  describe 'validate has at least minimum number of selections made for all choices' do
    it 'does not pass when less than minimum number of selections made' do
      subject.room_service_item = create(:room_service_item_with_choices, choices_count: 1)
      choice                    = subject.room_service_item.room_service_item_choices.first

      choice.minimum_number_of_selections = 1
      subject.validate

      expect(subject).to have_validation_error_on(:selected_options)
                           .with_message_symbol(:less_than_minimum_number_of_selections_made)
    end

    it 'passes when at least minimum number of selections made' do
      subject.room_service_item = create(:room_service_item_with_choices, choices_count: 1)
      choice                    = subject.room_service_item.room_service_item_choices.first

      choice.minimum_number_of_selections = 1
      subject.selected_options << choice.room_service_item_choice_options.first
      subject.validate

      expect(subject).not_to have_validation_error_on(:selected_options)
                               .with_message_symbol(:less_than_minimum_number_of_selections_made)
    end

    it 'passes when there is no minimum number of selections requirement' do
      subject.room_service_item = create(:room_service_item_with_choices, choices_count: 1)
      choice                    = subject.room_service_item.room_service_item_choices.first

      choice.minimum_number_of_selections = nil
      subject.validate

      expect(subject).not_to have_validation_error_on(:selected_options)
                               .with_message_symbol(:less_than_minimum_number_of_selections_made)
    end
  end

  describe 'validate has at most maximum number of selections made for all choices' do
    it 'does not pass when more than maximum number of selections made' do
      subject.room_service_item = create(:room_service_item_with_choices, choices_count: 1)
      choice                    = subject.room_service_item.room_service_item_choices.first

      expect(choice.room_service_item_choice_options.length).to eq(2)

      choice.maximum_number_of_selections = 1
      subject.selected_options            = choice.room_service_item_choice_options
      subject.validate

      expect(subject).to have_validation_error_on(:selected_options)
                           .with_message_symbol(:more_than_maximum_number_of_selections_made)
    end

    it 'passes when at most maximum number of selections made' do
      subject.room_service_item = create(:room_service_item_with_choices, choices_count: 1)
      choice                    = subject.room_service_item.room_service_item_choices.first

      choice.maximum_number_of_selections = 1
      subject.selected_options << choice.room_service_item_choice_options.first
      subject.validate

      expect(subject).not_to have_validation_error_on(:selected_options)
                               .with_message_symbol(:more_than_maximum_number_of_selections_made)
    end

    it 'passes when there is no maximum number of selections requirement' do
      subject.room_service_item = create(:room_service_item_with_choices, choices_count: 1)
      choice                    = subject.room_service_item.room_service_item_choices.first

      choice.maximum_number_of_selections = nil
      subject.validate

      expect(subject).not_to have_validation_error_on(:selected_options)
                               .with_message_symbol(:more_than_maximum_number_of_selections_made)
    end
  end

  describe 'validate item is available at the moment' do
    it 'is valid when the associated item is available' do
      subject.room_service_item = build(:room_service_item, :available_at_the_moment)

      subject.validate

      expect(subject).not_to have_validation_error_on(:room_service_item)
                               .with_message_symbol(:unavailable_at_the_moment)
    end

    it 'is invalid when the associated item is unavailable' do
      subject.room_service_item = build(:room_service_item, :unavailable_at_the_moment)

      subject.validate

      expect(subject).to have_validation_error_on(:room_service_item)
                           .with_message_symbol(:unavailable_at_the_moment)
    end
  end
end
