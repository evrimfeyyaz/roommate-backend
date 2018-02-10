class CreateJoinTableRoomServiceCartItemsRoomServiceItemChoiceOptions < ActiveRecord::Migration[5.1]
  def change
    create_join_table :room_service_cart_items, :room_service_item_choice_options, column_options: { type: :uuid } do |t|
      t.index [:room_service_cart_item_id, :room_service_item_choice_option_id], name: 'room_service_cart_items_on_item_choice_options'
      t.index [:room_service_item_choice_option_id, :room_service_cart_item_id], name: 'room_service_item_choice_options_on_cart_items'
    end
  end
end
