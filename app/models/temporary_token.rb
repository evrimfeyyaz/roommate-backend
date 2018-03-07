class TemporaryToken < ApplicationRecord
  validates_presence_of :device_ip

  before_create :set_expires_at
  before_create :set_value

  private

    def set_expires_at
      self.expires_at = 10.minutes.from_now
    end

    # Generates a four digit hexadecimal token.
    # Based on: https://stackoverflow.com/questions/6021372/best-way-to-create-unique-token-in-rails
    def set_value
      self.value = loop do
        random_token = SecureRandom.hex(2)
        break random_token unless self.class
                                    .where(value: random_token)
                                    .where('expires_at >= ?', Time.current)
                                    .present?
      end
    end
end