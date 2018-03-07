require 'rails_helper'

describe 'endStay mutation' do
  it 'concludes a stay with given ID' do
    stay = create(:stay)

    mutation_string = <<~GRAPHQL
      mutation endStay($id: ID!) {
        endStay(id: $id) {
          id
          beginDate
          endDate
          roomNumber
        }
      }
    GRAPHQL

    result = RoommateBackendSchema.execute(mutation_string,
                                           variables: { 'id' => stay.id })
    expect(result['errors']).to be_nil

    returned_stay = result['data']['endStay']

    expect(returned_stay['id']).to eq(stay.id)
    expect(returned_stay['beginDate']).to eq(stay.begin_date.to_s)
    expect(returned_stay['endDate']).to eq(Date.today.to_s)
    expect(returned_stay['roomNumber']).to eq(stay.room_number)
  end

  # TODO: Add a test to make sure that the end date is based on the hotel's time zone.
end