Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :roomServiceCategories, !types[Types::RoomServiceCategoryType] do
    resolve ->(obj, args, ctx) {
      RoomServiceCategory.all
    }
  end
end
