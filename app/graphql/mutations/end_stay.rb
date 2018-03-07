Mutations::EndStay = GraphQL::Field.define do
  name 'EndStay'

  type Types::StayType

  argument :id, !types.ID

  resolve Rescuable.new ->(_obj, args, _ctx) {
    id = args[:id]

    stay = Stay.find(id)
    stay.update(end_date: Date.today)
    stay
  }
end