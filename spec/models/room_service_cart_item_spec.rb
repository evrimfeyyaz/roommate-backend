require 'rails_helper'

describe RoomServiceCartItem do
  it { should belong_to(:room_service_order) }
  it { should belong_to(:room_service_item) }
  it { should have_many(:selected_options) }

  it { should validate_numericality_of(:quantity).is_greater_than(0).only_integer }

  describe 'validates all mandatory choices has at least one selected option' do
    context 'when there is a mandatory choice' do
      context 'and no selected option' do
        it 'does have a validation error' do
          subject.room_service_item = build(:room_service_item, :with_mandatory_choice)
          choice = subject.room_service_item.room_service_item_choices.first

          subject.validate

          expect(subject).to have_validation_error_on(:selected_options)
                               .with_message_symbol(:does_not_include_selection_for_mandatory_choice)
                               .with_message_string("should include a selection for \"#{choice.title}\"")
        end
      end

      context 'and a selected option' do
        it 'does not have a validation error' do
          subject.room_service_item = create(:room_service_item, :with_mandatory_choice)
          choice = subject.room_service_item.room_service_item_choices.first
          subject.selected_options << choice.room_service_item_choice_options.first

          subject.validate

          expect(subject).not_to have_validation_error_on(:selected_options)
                               .with_message_symbol(:does_not_include_selection_for_mandatory_choice)
                               .with_message_string("should include a selection for \"#{choice.title}\"")
        end
      end
    end

    context 'when there is an optional choice and no selected choice' do
      it 'does not have a validation error' do
        subject.room_service_item = create(:room_service_item, :with_optional_choice)
        choice = subject.room_service_item.room_service_item_choices.first

        subject.validate

        expect(subject).not_to have_validation_error_on(:selected_options)
                                 .with_message_symbol(:does_not_include_selection_for_mandatory_choice)
                                 .with_message_string("should include a selection for \"#{choice.title}\"")
      end
    end
  end

  describe 'validates all single-option choices have at most one selection' do
    context 'when there is a single-option choice' do
      context 'and more than one selected option' do
        it 'does have a validation error' do
          subject.room_service_item = create(:room_service_item, :with_single_option_choice)
          choice = subject.room_service_item.room_service_item_choices.first
          subject.selected_option_ids = choice.room_service_item_choice_option_ids

          subject.validate

          expect(subject).to have_validation_error_on(:selected_options)
                                   .with_message_symbol(:includes_multiple_selections_for_single_option_choice)
                                   .with_message_string("can only include one selection for \"#{choice.title}\"")
        end
      end

      context 'and one selected option' do
        it 'does not have a validation error' do
          subject.room_service_item = create(:room_service_item, :with_single_option_choice)
          choice = subject.room_service_item.room_service_item_choices.first
          subject.selected_options << choice.room_service_item_choice_options.first

          subject.validate

          expect(subject).not_to have_validation_error_on(:selected_options)
                               .with_message_symbol(:includes_multiple_selections_for_single_option_choice)
                               .with_message_string("can only include one selection for \"#{choice.title}\"")
        end
      end
    end

    context 'when there is a multiple-option choice and multiple selections' do
      it 'does not have a validation error' do
        subject.room_service_item = create(:room_service_item, :with_multiple_option_choice)
        choice = subject.room_service_item.room_service_item_choices.first
        subject.selected_option_ids = choice.room_service_item_choice_option_ids

        subject.validate

        expect(subject).not_to have_validation_error_on(:selected_options)
                             .with_message_symbol(:includes_multiple_selections_for_single_option_choice)
                             .with_message_string("can only include one selection for \"#{choice.title}\"")
      end
    end
  end
end
