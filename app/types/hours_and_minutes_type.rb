class HoursAndMinutesType < ActiveRecord::Type::String
  def deserialize(value)
    return super(Time.zone.parse(value).strftime('%H:%M')) if value.present?

    super
  end
end