class RoomServiceCategory < ApplicationRecord
  acts_as_tenant :hotel

  has_many :room_service_categories_items
  has_many :room_service_items, through: :room_service_categories_items

  validates_presence_of :title

  def available_from
    as_hours_and_minutes(self[:available_from])
  end

  def available_until
    as_hours_and_minutes(self[:available_until])
  end

  def available_at_the_moment?
    return true if available_from.blank? && available_until.blank?

    current_time = as_hours_and_minutes(Time.current)
    time_between?(current_time, available_from, available_until)
  end

  private

    def time_between?(time, from, til)
      from = '00:00' if from.blank?
      til  = '23:59' if til.blank?

      return time >= from && time <= til if from <= til

      time >= from || time <= til
    end

    def as_hours_and_minutes(time)
      return nil if time.blank?

      Time.use_zone('UTC') do
        return Time.parse(time.to_s).strftime('%H:%M')
      end
    end
end
