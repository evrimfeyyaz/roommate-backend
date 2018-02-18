Types::RoomServiceCategoryType = GraphQL::ObjectType.define do
  name 'RoomServiceCategory'

  field :id, !types.ID
  field :title, !types.String
  field :availableFrom, types.String, property: :available_from
  field :availableUntil, types.String, property: :available_until
  field :items, !types[Types::RoomServiceItemType], property: :room_service_items
end
