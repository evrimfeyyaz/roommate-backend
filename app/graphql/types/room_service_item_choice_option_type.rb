Types::RoomServiceItemChoiceOptionType = GraphQL::ObjectType.define do
  name 'RoomServiceItemChoiceOption'

  field :id, !types.ID
  field :title, !types.String
  field :price, types.String
  field :choiceId, !types.ID, property: :room_service_item_choice_id
end
