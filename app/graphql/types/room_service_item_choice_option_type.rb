Types::RoomServiceItemChoiceOptionType = GraphQL::ObjectType.define do
  name 'RoomServiceItemChoiceOption'

  field :id, !types.ID
  field :title, !types.String
  field :price, types.String
end
