Types::RoomServiceItemType = GraphQL::ObjectType.define do
  name 'RoomServiceItem'

  field :id, !types.ID
  field :title, !types.String
  field :description, types.String
  field :price, types.String
  field :thumbnail1x, types.String, property: :thumbnail_1x
  field :thumbnail2x, types.String, property: :thumbnail_2x
  field :image1x, types.String, property: :image_1x
  field :image2x, types.String, property: :image_2x
  field :choices, !types[Types::RoomServiceItemChoiceType], property: :room_service_item_choices
  field :tags, !types[Types::RoomServiceItemTagType], property: :room_service_item_tags
end
