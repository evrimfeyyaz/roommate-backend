require 'rails_helper'

describe 'roomServiceCategory' do
  it 'returns the room service category with a given ID' do
    category = create(:room_service_category)
    item = create(:room_service_item, categories: [category])

    query_string = <<~GRAPHQL
      {
        roomServiceCategory(id: "#{category.id}") {
          id
          title
          items {
            id
            title
          }
        }
      }
    GRAPHQL

    result = RoommateBackendSchema.execute(query_string)
    returned_category = result['data']['roomServiceCategory']

    expect(returned_category['id']).to eq(category.id)
    expect(returned_category['title']).to eq(category.title)
    expect(returned_category['items'].count).to eq(1)
    expect(returned_category['items'].first['id']).to eq(item.id)
    expect(returned_category['items'].first['title']).to eq(item.title)
  end
end