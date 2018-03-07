require 'rails_helper'

describe 'endStay mutation' do
  it 'concludes a stay with given ID' do
    stay = create(:stay)

    mutation_string = <<~GRAPHQL
      mutation endStay($id: ID!) {
        endStay(id: $id) {
          id
          createdAt
          endedAt
          roomNumber
        }
      }
    GRAPHQL

    result = RoommateBackendSchema.execute(mutation_string,
                                           variables: { 'id' => stay.id })
    expect(result['errors']).to be_nil

    stay.reload
    returned_stay = result['data']['endStay']

    expect(returned_stay['id']).to eq(stay.id)
    expect(returned_stay['createdAt']).to eq(stay.created_at.to_s)
    expect(returned_stay['endedAt']).to eq(stay.ended_at.to_s)
    expect(returned_stay['roomNumber']).to eq(stay.room_number)
  end
end