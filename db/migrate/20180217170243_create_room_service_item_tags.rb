class CreateRoomServiceItemTags < ActiveRecord::Migration[5.1]
  def change
    create_table :room_service_item_tags, id: :uuid do |t|
      t.string :title
    end
  end
end