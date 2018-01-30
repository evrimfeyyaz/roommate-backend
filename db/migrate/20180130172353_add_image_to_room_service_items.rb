class AddImageToRoomServiceItems < ActiveRecord::Migration[5.1]
  def change
    add_column :room_service_items, :image, :string
  end
end
