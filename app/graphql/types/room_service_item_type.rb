Types::RoomServiceItemType = GraphQL::ObjectType.define do
  name 'RoomServiceItem'

  field :id, !types.ID
  field :title, !types.String
  field :description, types.String
  field :price, types.String
end
