Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :roomServiceCategories, !types[Types::RoomServiceCategoryType] do
    resolve ->(_obj, _args, _ctx) { RoomServiceCategory.all }
  end

  field :roomServiceCategory, !Types::RoomServiceCategoryType do
    argument :id, !types.ID

    resolve ->(_obj, args, _ctx) { RoomServiceCategory.find(args['id']) }
  end
end
