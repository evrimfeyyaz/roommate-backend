require 'rails_helper'

describe 'createRoomServiceOrder mutation' do
  it 'creates a room service order with given parameters' do
    category        = create(:room_service_category)
    item            = create(:room_service_item, room_service_categories: [category])
    quantity        = 2
    special_request = 'Please bring a bucket of ice.'
    payment_option  = 'room_bill'

    mutation_string = <<~GRAPHQL
      mutation {
        createRoomServiceOrder(roomServiceOrder: {
          roomServiceCartItems: [
            { roomServiceItemId: "#{item.id}", quantity: #{quantity} }
          ],
          specialRequest: "#{special_request}",
          paymentOption: "#{payment_option}"
        }) {
          id
          specialRequest
          paymentOption
          roomServiceCartItems {
            id
            quantity
            roomServiceItem {
              id
            }
          }
        }
      }
    GRAPHQL

    result = RoommateBackendSchema.execute(mutation_string)
    expect(result['errors']).to be_nil

    returned_order     = result['data']['createRoomServiceOrder']
    returned_cart_item = returned_order['roomServiceCartItems'][0]

    created_order     = RoomServiceOrder.last
    created_cart_item = RoomServiceCartItem.last

    expect(returned_order['id']).to eq(created_order.id)
    expect(returned_order['specialRequest']).to eq(special_request)
    expect(returned_order['paymentOption']).to eq(payment_option)
    expect(returned_order['roomServiceCartItems'].count).to eq(1)

    expect(returned_cart_item['id']).to eq(created_cart_item.id)
    expect(returned_cart_item['quantity']).to eq(quantity)
    expect(returned_cart_item['roomServiceItem']['id']).to eq(item.id)
  end
end