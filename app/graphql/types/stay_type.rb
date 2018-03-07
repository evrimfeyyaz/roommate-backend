Types::StayType = GraphQL::ObjectType.define do
  name 'Stay'

  field :id, !types.ID
  field :beganAt, !types.String, property: :began_at
  field :endedAt, types.String, property: :ended_at
  field :roomNumber, !types.String, property: :room_number
end