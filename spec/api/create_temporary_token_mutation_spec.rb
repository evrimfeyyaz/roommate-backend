require 'rails_helper'

describe 'createTemporaryToken mutation' do
  it 'creates a temporary token using given IP' do
    device_ip = '127.0.0.1'

    mutation_string = <<~GRAPHQL
      mutation createTemporaryToken($deviceIp: String!) {
        createTemporaryToken(deviceIp: $deviceIp) {
          id
          deviceIp
          expiresAt
          value
          usedAt
        }
      }
    GRAPHQL

    result = RoommateBackendSchema.execute(mutation_string,
                                           variables: { 'deviceIp' => device_ip })
    expect(result['errors']).to be_nil

    returned_token = result['data']['createTemporaryToken']

    created_token = TemporaryToken.last

    expect(returned_token['id']).to eq(created_token.id)
    expect(returned_token['deviceIp']).to eq(created_token.device_ip)
    expect(returned_token['expiresAt']).to eq(created_token.expires_at.to_s)
    expect(returned_token['value']).to eq(created_token.value)
    expect(returned_token['usedAt']).to eq(created_token.used_at)
  end
end