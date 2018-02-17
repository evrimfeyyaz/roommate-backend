Types::RoomServiceItemTagType = GraphQL::ObjectType.define do
  name 'RoomServiceItemTag'

  field :id, !types.ID
  field :title, !types.String
end
