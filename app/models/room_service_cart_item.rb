class RoomServiceCartItem < ApplicationRecord
  acts_as_tenant :hotel

  belongs_to :hotel
  belongs_to :room_service_order
  belongs_to :room_service_item
  has_many :room_service_cart_items_item_choice_options
  has_many :selected_options,
           through:    :room_service_cart_items_item_choice_options,
           class_name: 'RoomServiceItemChoiceOption',
           source:     :room_service_item_choice_option

  validates_numericality_of :quantity, greater_than: 0, only_integer: true
  validate :has_at_least_minimum_number_of_selections_made_for_all_choices
  validate :has_at_most_maximum_number_of_selections_made_for_all_choices
  validate :item_is_available_at_the_moment

  private

    def number_of_selections_for_choice(choice)
      (choice.room_service_item_choice_option_ids & selected_option_ids).length
    end

    def has_at_least_minimum_number_of_selections_made_for_all_choices
      return if room_service_item.blank?

      room_service_item.room_service_item_choices.each do |choice|
        next if choice.minimum_number_of_selections.blank?
        next if number_of_selections_for_choice(choice) >= choice.minimum_number_of_selections

        errors.add(:selected_options, :less_than_minimum_number_of_selections_made,
                   message:                             'should include at least %{choice_minimum_number_of_selections} selection(s) for "%{choice_title}"',
                   choice_title:                        choice.title,
                   choice_minimum_number_of_selections: choice.minimum_number_of_selections,
                   choice_id:                           choice.id)
      end
    end

    def has_at_most_maximum_number_of_selections_made_for_all_choices
      return if room_service_item.blank?

      room_service_item.room_service_item_choices.each do |choice|
        next if choice.maximum_number_of_selections.blank?
        next if number_of_selections_for_choice(choice) <= choice.maximum_number_of_selections

        errors.add(:selected_options, :more_than_maximum_number_of_selections_made,
                   message:                             'should include at most %{choice_maximum_number_of_selections} selection(s) for "%{choice_title}"',
                   choice_title:                        choice.title,
                   choice_maximum_number_of_selections: choice.maximum_number_of_selections,
                   choice_id:                           choice.id)
      end
    end

    def item_is_available_at_the_moment
      return if room_service_item.blank? || room_service_item.available_at_the_moment?

      errors.add(:room_service_item, :unavailable_at_the_moment,
                 message: 'is unavailable at the moment')
    end
end