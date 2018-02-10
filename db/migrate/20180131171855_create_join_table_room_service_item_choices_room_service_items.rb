class CreateJoinTableRoomServiceItemChoicesRoomServiceItems < ActiveRecord::Migration[5.1]
  def change
    create_join_table :room_service_item_choices, :room_service_items, column_options: { type: :uuid } do |t|
      t.index [:room_service_item_choice_id, :room_service_item_id], name: 'room_service_item_choices_on_items'
      t.index [:room_service_item_id, :room_service_item_choice_id], name: 'room_service_items_on_item_choices'
    end
  end
end
