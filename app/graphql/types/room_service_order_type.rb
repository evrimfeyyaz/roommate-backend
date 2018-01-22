Types::RoomServiceOrderType = GraphQL::ObjectType.define do
  name 'RoomServiceOrder'

  field :id, !types.ID
  field :paymentOption, !types.String, property: :payment_option
  field :specialRequest, types.String, property: :special_request
  field :roomServiceCartItems, !types[Types::RoomServiceCartItemType], property: :room_service_cart_items
end