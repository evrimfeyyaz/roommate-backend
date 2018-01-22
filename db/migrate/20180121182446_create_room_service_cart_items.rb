class CreateRoomServiceCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :room_service_cart_items, id: :uuid do |t|
      t.belongs_to :room_service_item, foreign_key: true, type: :uuid
      t.integer :quantity
    end
  end
end
