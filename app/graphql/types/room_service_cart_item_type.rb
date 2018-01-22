Types::RoomServiceCartItemType = GraphQL::ObjectType.define do
  name 'RoomServiceCartItem'

  field :id, !types.ID
  field :quantity, !types.Int
  field :roomServiceItem, !Types::RoomServiceItemType, property: :room_service_item
  field :roomServiceItemId, !types.ID, property: :room_service_item_id
end