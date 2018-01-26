Types::RoomServiceCartItemType = GraphQL::ObjectType.define do
  name 'RoomServiceCartItem'

  field :id, !types.ID
  field :quantity, !types.Int
  field :item, !Types::RoomServiceItemType, property: :room_service_item
  field :itemId, !types.ID, property: :room_service_item_id
end