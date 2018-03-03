Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createRoomServiceOrder, Mutations::CreateRoomServiceOrder
  field :createTemporaryToken, Mutations::CreateTemporaryToken
end