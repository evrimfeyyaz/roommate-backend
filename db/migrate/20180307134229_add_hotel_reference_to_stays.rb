class AddHotelReferenceToStays < ActiveRecord::Migration[5.1]
  def change
    add_reference :stays, :hotel, foreign_key: true, type: :uuid, index: true
  end
end
