Mutations::CreateStay = GraphQL::Field.define do
  name 'CreateStay'

  type Types::StayType

  argument :roomNumber, !types.String, as: :room_number

  resolve Rescuable.new ->(_obj, args, _ctx) {
    room_number = args[:room_number]

    Stay.create!(room_number: room_number, began_at: Time.current)
  }
end