class CreateRoomServiceOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :room_service_orders, id: :uuid do |t|
      t.string :special_request
      t.integer :payment_option
    end
  end
end
