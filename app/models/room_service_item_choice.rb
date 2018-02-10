class RoomServiceItemChoice < ApplicationRecord
  has_many :room_service_item_choices_items
  has_many :room_service_items, through: :room_service_item_choices_items
  has_many :room_service_item_choice_options
  belongs_to :default_option, class_name: 'RoomServiceItemChoiceOption'

  attribute :optional, :boolean, default: true
  attribute :allows_multiple_selections, :boolean, default: false

  validates_presence_of :title
  validates_inclusion_of :optional, in: [true, false]
  validates_inclusion_of :allows_multiple_selections, in: [true, false]
  validates_length_of :room_service_item_choice_options, minimum: 2
end