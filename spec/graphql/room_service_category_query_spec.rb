require 'rails_helper'

describe 'roomServiceCategory query' do
  it 'returns the room service category with a given ID' do
    available_from  = '18:00'
    available_until = '23:00'
    category        = create(:room_service_category, available_from: available_from, available_until: available_until)
    item            = create(:room_service_item_with_choices,
                             :with_thumbnail, :with_image, :with_tag,
                             room_service_categories: [category],
                             choices_count:           1)
    choice          = item.room_service_item_choices.first
    tag             = item.room_service_item_tags.first
    option1         = choice.room_service_item_choice_options.first
    option2         = choice.room_service_item_choice_options.last

    # TODO: Make this a named query.
    query_string = <<~GRAPHQL
      {
        roomServiceCategory(id: "#{category.id}") {
          id
          title
          availableFrom
          availableUntil
          items {
            id
            title
            description
            price
            thumbnail1x
            thumbnail2x
            image1x
            image2x
            choices {
              id
              title
              minimumNumberOfSelections
              maximumNumberOfSelections
              defaultOptionId
              options {
                id
                title
                price
                choiceId
              }
            }
            tags {
              id
              title
            }
          }
        }
      }
    GRAPHQL

    result = RoommateBackendSchema.execute(query_string)
    expect(result['errors']).to be_nil

    returned_category = result['data']['roomServiceCategory']

    expect(returned_category['id']).to eq(category.id)
    expect(returned_category['title']).to eq(category.title)
    expect(returned_category['availableFrom']).to eq(available_from)
    expect(returned_category['availableUntil']).to eq(available_until)

    expect(returned_category['items'].count).to eq(1)
    returned_item = returned_category['items'].first
    expect(returned_item['id']).to eq(item.id)
    expect(returned_item['title']).to eq(item.title)
    expect(returned_item['description']).to eq(item.description)
    expect(returned_item['price']).to eq(item.price.to_s)

    expect(returned_item['image1x']).to end_with('jpg')
    expect(returned_item['image2x']).to end_with('jpg')
    expect(returned_item['thumbnail1x']).to end_with('jpg')
    expect(returned_item['thumbnail2x']).to end_with('jpg')

    expect(returned_item['choices'].length).to eq(1)
    returned_choice = returned_item['choices'].first
    expect(returned_choice['title']).to eq(choice.title)
    expect(returned_choice['maximumNumberOfSelections']).to eq(choice.maximum_number_of_selections)
    expect(returned_choice['minimumNumberOfSelections']).to eq(choice.minimum_number_of_selections)
    expect(returned_choice['defaultOptionId']).to eq(choice.default_option_id)

    expect(returned_item['tags'].length).to eq(1)
    returned_tag = returned_item['tags'].first
    expect(returned_tag['title']).to eq(tag.title)

    expect(returned_choice['options'].length).to eq(2)
    returned_option1 = returned_choice['options'].first
    expect(returned_option1['title']).to eq(option1.title)
    expect(returned_option1['price']).to eq(option1.price)
    expect(returned_option1['choiceId']).to eq(choice.id)
    returned_option2 = returned_choice['options'].last
    expect(returned_option2['title']).to eq(option2.title)
    expect(returned_option2['price']).to eq(option2.price)
    expect(returned_option2['choiceId']).to eq(choice.id)
  end
end