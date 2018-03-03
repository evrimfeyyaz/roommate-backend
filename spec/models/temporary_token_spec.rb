require 'rails_helper'

describe TemporaryToken do
  it { should validate_presence_of(:device_ip) }

  describe '#value' do
    it 'is set to a six digit token before create' do
      token = build(:temporary_token)

      expect(token.value).to be_nil

      token.save!

      expect(token.value.length).to eq(4)
    end

    context 'when another token that has the same value exists' do
      # These tests are not the best tests as they are based on an
      # intrinsic knowledge of the method that generates the random
      # token, but they should do for now.

      EXISTING_TOKEN     = '1234'.freeze
      NON_EXISTING_TOKEN = '0000'.freeze

      before(:each) do
        # We first create the existing token, and then we want the newly created token to
        # first try to create a token with the same value as the existing token. That's why
        # `#hex` returns the existing token value twice, before returning a non-existing one.
        allow(SecureRandom).to receive(:hex).with(2)
                                 .and_return(EXISTING_TOKEN,
                                             EXISTING_TOKEN,
                                             NON_EXISTING_TOKEN)
      end

      it 'generates a new token when the existing token is not expired' do
        expect(SecureRandom).to receive(:hex).once
        existing_token = create(:temporary_token)

        expect(SecureRandom).to receive(:hex).twice
        new_token = create(:temporary_token)

        expect(new_token.value).to eq(NON_EXISTING_TOKEN)
      end

      it 'does not generate a new token when the existing token is expired' do
        expect(SecureRandom).to receive(:hex).once
        existing_token = create(:temporary_token)
        existing_token.update(expires_at: 1.day.ago)

        expect(SecureRandom).to receive(:hex).once
        new_token = create(:temporary_token)

        expect(new_token.value).to eq(EXISTING_TOKEN)
      end
    end
  end

  describe '#expires_at' do
    it 'is set before create to ten minutes after the time it is saved' do
      token = build(:temporary_token)

      expect(token.expires_at).to be_nil

      token.save!

      expect(token.expires_at).to be_between(9.minutes.from_now, 11.minutes.from_now)
    end
  end
end