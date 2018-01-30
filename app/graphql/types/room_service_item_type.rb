Types::RoomServiceItemType = GraphQL::ObjectType.define do
  name 'RoomServiceItem'

  field :id, !types.ID
  field :title, !types.String
  field :description, types.String
  field :price, types.String
  field :thumbnail1x, types.String, property: :thumbnail_1x
  field :thumbnail2x, types.String, property: :thumbnail_2x
end
