class RoomServiceCategory < ApplicationRecord
  has_many :room_service_categories_items
  has_many :room_service_items, through: :room_service_categories_items

  validates_presence_of :title

  def available?
    return true if available_from.nil? || available_until.nil?

    time_between?(Time.current, available_from, available_until)
  end

  private

    def time_between?(time, from, til)
      time = time.strftime('%H:%M')
      from = from.strftime('%H:%M')
      til  = til.strftime('%H:%M')

      return time >= from && time <= til if from <= til

      time >= from || time <= til
    end
end
