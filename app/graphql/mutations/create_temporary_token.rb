Mutations::CreateTemporaryToken = GraphQL::Field.define do
  name 'CreateTemporaryToken'

  type Types::TemporaryTokenType

  argument :deviceIp, !types.String, as: :device_ip

  resolve Rescuable.new ->(_obj, args, _ctx) {
    device_ip = args[:device_ip]

    TemporaryToken.create!(device_ip: device_ip)
  }
end