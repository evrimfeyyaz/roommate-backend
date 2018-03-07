class AddRoomNumberToRoomServiceOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :room_service_orders, :room_number, :string
  end
end
