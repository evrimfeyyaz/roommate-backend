Types::TemporaryTokenType = GraphQL::ObjectType.define do
  name 'TemporaryToken'

  field :id, !types.ID
  field :deviceIp, !types.String, property: :device_ip
  field :expiresAt, !types.String, property: :expires_at
  field :value, !types.String
  field :usedAt, types.String, property: :used_at
end