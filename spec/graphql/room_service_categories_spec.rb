require 'rails_helper'

describe 'roomServiceCategories' do
  it 'returns all room service categories' do
    category = create(:room_service_category)

    # TODO: Make this a named query.
    query_string = <<~GRAPHQL
      {
        roomServiceCategories {
          id
          title
        }
      }
    GRAPHQL

    result = RoommateBackendSchema.execute(query_string)
    result_data = result['data']['roomServiceCategories']

    expect(result_data.count).to eq(1)
    expect(result_data.first['id']).to eq(category.id)
    expect(result_data.first['title']).to eq(category.title)
  end
end