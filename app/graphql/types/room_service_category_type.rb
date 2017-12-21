Types::RoomServiceCategoryType = GraphQL::ObjectType.define do
  name 'RoomServiceCategory'

  field :id, !types.ID
  field :title, !types.String
end
