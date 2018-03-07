Types::StayType = GraphQL::ObjectType.define do
  name 'Stay'

  field :id, !types.ID
  field :beginDate, !types.String, property: :begin_date
  field :endDate, types.String, property: :end_date
  field :roomNumber, !types.String, property: :room_number
end