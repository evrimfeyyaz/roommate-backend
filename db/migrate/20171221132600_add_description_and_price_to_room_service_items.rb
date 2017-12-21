class AddDescriptionAndPriceToRoomServiceItems < ActiveRecord::Migration[5.1]
  def change
    add_column :room_service_items, :price, :decimal
    add_column :room_service_items, :description, :text
  end
end
