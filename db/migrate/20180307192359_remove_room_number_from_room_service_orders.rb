class RemoveRoomNumberFromRoomServiceOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :room_service_orders, :room_number, :string
  end
end
