require "administrate/field/base"

# From: https://github.com/thoughtbot/administrate/issues/533
class EnumField < Administrate::Field::Base
  def to_s
    data
  end

  def select_field_values(form_builder)
    form_builder.object.class.public_send(attribute.to_s.pluralize).keys.map do |v|
      [v.titleize, v]
    end
  end
end
