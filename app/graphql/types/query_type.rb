Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :roomServiceCategories, !types[Types::RoomServiceCategoryType] do
    resolve ->(obj, args, ctx) {
      RoomServiceCategory.all
    }
  end

  field :roomServiceCategory, !Types::RoomServiceCategoryType do
    argument :id, !types.ID

    resolve ->(obj, args, ctx) {
      RoomServiceCategory.find(args['id'])
    }
  end
end
