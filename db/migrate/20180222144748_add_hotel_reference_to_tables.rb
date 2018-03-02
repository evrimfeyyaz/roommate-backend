class AddHotelReferenceToTables < ActiveRecord::Migration[5.1]
  def change
    add_reference :room_service_categories, :hotel, foreign_key: true, type: :uuid, index: true
    add_reference :room_service_items, :hotel, foreign_key: true, type: :uuid, index: true
    add_reference :room_service_item_choices, :hotel, foreign_key: true, type: :uuid, index: true
    add_reference :room_service_item_choice_options, :hotel, foreign_key: true, type: :uuid, index: true
    add_reference :room_service_cart_items, :hotel, foreign_key: true, type: :uuid, index: true
    add_reference :room_service_item_tags, :hotel, foreign_key: true, type: :uuid, index: true
    add_reference :room_service_orders, :hotel, foreign_key: true, type: :uuid, index: true
  end
end
