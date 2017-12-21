require 'rails_helper'

describe 'Room Service Categories' do
  it 'returns all room service categories' do
    categories = create_list(:room_service_category, 2)

    query_string = <<~GRAPHQL
      {
        roomServiceCategories {
          id
          title
        }
      }
    GRAPHQL

    result = RoommateBackendSchema.execute(query_string)

    pp result if result['errors']

    returned_categories = result['data']['roomServiceCategories']

    categories.each do |category|
      relevant_returned_category = returned_categories.detect { |c| c['id'] == category.id }

      relevant_returned_category.each do |key, value|
        expect(category[key]).to eq(value)
      end
    end
  end
end