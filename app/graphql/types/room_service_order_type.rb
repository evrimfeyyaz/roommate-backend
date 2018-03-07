Types::RoomServiceOrderType = GraphQL::ObjectType.define do
  name 'RoomServiceOrder'

  field :id, !types.ID
  field :paymentOption, !types.String, property: :payment_option
  field :specialRequest, types.String, property: :special_request
  field :roomNumber, !types.String, property: :room_number
  field :stayId, !types.ID, property: :stay_id
  field :cartItems, !types[Types::RoomServiceCartItemType], property: :room_service_cart_items
end