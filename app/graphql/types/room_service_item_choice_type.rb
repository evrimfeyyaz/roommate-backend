Types::RoomServiceItemChoiceType = GraphQL::ObjectType.define do
  name 'RoomServiceItemChoice'

  field :id, !types.ID
  field :title, !types.String
  field :minimumNumberOfSelections, types.Int, property: :minimum_number_of_selections
  field :maximumNumberOfSelections, types.Int, property: :maximum_number_of_selections
  field :defaultOptionId, types.ID, property: :default_option_id
  field :options, !types[Types::RoomServiceItemChoiceOptionType], property: :room_service_item_choice_options
end
