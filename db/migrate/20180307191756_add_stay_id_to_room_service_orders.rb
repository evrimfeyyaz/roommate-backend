class AddStayIdToRoomServiceOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :room_service_orders, :stay, foreign_key: true, type: :uuid, index: true
  end
end
