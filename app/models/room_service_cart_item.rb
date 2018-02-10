class RoomServiceCartItem < ApplicationRecord
  belongs_to :room_service_order
  belongs_to :room_service_item
  has_many :room_service_cart_items_item_choice_options
  has_many :selected_options,
           through:    :room_service_cart_items_item_choice_options,
           class_name: 'RoomServiceItemChoiceOption',
           source:     :room_service_item_choice_option

  validates_numericality_of :quantity, greater_than: 0, only_integer: true
  validate :existence_of_selection_for_mandatory_choices
  validate :single_selection_for_single_option_choices

  private

    def selected_option_for_choice?(choice)
      (choice.room_service_item_choice_option_ids & selected_option_ids).any?
    end

    def single_or_no_selected_option_for_choice?(choice)
      (choice.room_service_item_choice_option_ids & selected_option_ids).length <= 1
    end

    def existence_of_selection_for_mandatory_choices
      room_service_item&.room_service_item_choices&.each do |choice|
        unless choice.optional || selected_option_for_choice?(choice)
          errors.add(:selected_options, :does_not_include_selection_for_mandatory_choice,
                     message:      'should include a selection for "%{choice_title}"',
                     choice_title: choice.title,
                     choice_id:    choice.id)
        end
      end
    end

    def single_selection_for_single_option_choices
      room_service_item&.room_service_item_choices&.each do |choice|
        unless choice.allows_multiple_selections || single_or_no_selected_option_for_choice?(choice)
          errors.add(:selected_options, :includes_multiple_selections_for_single_option_choice,
                     message:      'can only include one selection for "%{choice_title}"',
                     choice_title: choice.title,
                     choice_id:    choice.id)
        end
      end
    end
end