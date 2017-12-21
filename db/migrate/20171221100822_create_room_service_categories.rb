class CreateRoomServiceCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :room_service_categories, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
  end
end
