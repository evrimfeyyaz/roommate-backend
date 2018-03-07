require 'rails_helper'

describe 'createStay mutation' do
  it 'creates a stay with given parameters' do
    room_number = '42'

    mutation_string = <<~GRAPHQL
      mutation createStay($roomNumber: String!) {
        createStay(roomNumber: $roomNumber) {
          id
          beganAt
          roomNumber
        }
      }
    GRAPHQL

    result = RoommateBackendSchema.execute(mutation_string,
                                           variables: { 'roomNumber' => room_number })
    expect(result['errors']).to be_nil

    returned_stay = result['data']['createStay']

    created_stay = Stay.last

    expect(returned_stay['id']).to eq(created_stay.id)
    expect(returned_stay['beganAt']).to eq(created_stay.began_at.to_s)
    expect(returned_stay['roomNumber']).to eq(room_number)
  end
end