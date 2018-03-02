class AddTimestampsToMissingTables < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :hotels, null: true
    add_timestamps :room_service_cart_items, null: true
    add_timestamps :room_service_item_choice_options, null: true
    add_timestamps :room_service_item_choices, null: true
    add_timestamps :room_service_item_tags, null: true
  end
end