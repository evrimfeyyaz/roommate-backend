class CreateJoinTableRoomServiceItemsRoomServiceItemTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :room_service_items, :room_service_item_tags, column_options: { type: :uuid } do |t|
      t.index [:room_service_item_id, :room_service_item_tag_id], name: 'room_service_items_on_tags'
      t.index [:room_service_item_tag_id, :room_service_item_id], name: 'room_service_tags_on_items'
    end
  end
end
