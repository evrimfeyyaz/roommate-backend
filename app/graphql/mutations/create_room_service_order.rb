Mutations::CreateRoomServiceOrder = GraphQL::Field.define do
  name 'CreateRoomServiceOrder'

  type Types::RoomServiceOrderType

  argument :order, !RoomServiceOrderInputType

  resolve Rescuable.new ->(_obj, args, _ctx) {
    order_args = args[:order].to_h

    cart_items_hash = {}
    order_args['room_service_cart_items'].each_with_index do |arg, index|
      cart_items_hash[index.to_s] = arg.to_h
    end

    order_args                                       = order_args.except('room_service_cart_items')
    order_args['room_service_cart_items_attributes'] = cart_items_hash

    RoomServiceOrder.create!(order_args)
  }
end

RoomServiceCartItemInputType = GraphQL::InputObjectType.define do
  name 'RoomServiceCartItemInputType'

  argument :quantity, !types.Int
  argument :itemId, !types.ID, as: :room_service_item_id
end

RoomServiceOrderInputType = GraphQL::InputObjectType.define do
  name 'RoomServiceOrderInputType'

  argument :cartItems, !types[!RoomServiceCartItemInputType], as: :room_service_cart_items
  argument :specialRequest, types.String, as: :special_request
  argument :paymentOption, !types.String, as: :payment_option
end