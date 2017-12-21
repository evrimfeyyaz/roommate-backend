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
            description
            price
          }
        }
      }
    GRAPHQL

    result = RoommateBackendSchema.execute(query_string)
    returned_category = result['data']['roomServiceCategory']

    expect(returned_category['id']).to eq(category.id)
    expect(returned_category['title']).to eq(category.title)
    expect(returned_category['items'].count).to eq(1)

    returned_item = returned_category['items'].first
    expect(returned_item['id']).to eq(item.id)
    expect(returned_item['title']).to eq(item.title)
    expect(returned_item['description']).to eq(item.description)
    expect(returned_item['price']).to eq(item.price.to_s)
  end
end