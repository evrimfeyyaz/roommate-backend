require "administrate/field/base"

class TimeZoneField < Administrate::Field::Base
  def to_s
    data
  end
end
