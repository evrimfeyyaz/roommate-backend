RSpec::Matchers.define :have_validation_error_on do |on_attribute|
  match do |object|
    if @message_symbol.present? &&
       object.errors.details[on_attribute].empty? { |error| error[:error] == @message_symbol }
      return false
    end

    return false if @message_string.present? && object.errors[on_attribute].exclude?(@message_string)

    return true
  end

  chain :with_message_symbol, :message_symbol
  chain :with_message_string, :message_string
end