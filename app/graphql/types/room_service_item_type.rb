Types::RoomServiceItemType = GraphQL::ObjectType.define do
  name 'RoomServiceItem'

  field :id, !types.ID
  field :title, !types.String
end
