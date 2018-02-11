class RoomServiceItemChoice < ApplicationRecord
  has_many :room_service_item_choices_items
  has_many :room_service_items, through: :room_service_item_choices_items
  has_many :room_service_item_choice_options
  belongs_to :default_option, class_name: 'RoomServiceItemChoiceOption', optional: true

  validates_presence_of :title
  validates_length_of :room_service_item_choice_options, minimum: 2
  validates_numericality_of :minimum_number_of_selections, greater_than: 0, only_integer: true, allow_nil: true

  validate :maximum_number_of_selections_is_greater_than_or_equal_to_minimum

  def maximum_number_of_selections_is_greater_than_or_equal_to_minimum
    return if maximum_number_of_selections.nil? || minimum_number_of_selections.nil?
    return if maximum_number_of_selections >= minimum_number_of_selections

    errors.add(:maximum_number_of_selections, :less_than_minimum,
               message: "maximum number of selections can't be less than the minimum")
  end
end