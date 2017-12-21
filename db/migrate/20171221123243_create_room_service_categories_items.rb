class CreateRoomServiceCategoriesItems < ActiveRecord::Migration[5.1]
  def change
    create_table :room_service_categories_items, id: :uuid do |t|
      t.references :room_service_category, foreign_key: true, type: :uuid
      t.references :room_service_item, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
