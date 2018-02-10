RSpec::Matchers.define :have_validation_error_on do |on_attribute|
  match do |object|
    object.errors.details[on_attribute].present? &&
      object.errors.details[on_attribute].any? { |error| error[:error] == @message_symbol } &&
      object.errors[on_attribute].include?(@message_string)
  end

  chain :with_message_symbol, :message_symbol
  chain :with_message_string, :message_string
end