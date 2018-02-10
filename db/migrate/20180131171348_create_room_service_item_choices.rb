class CreateRoomServiceItemChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :room_service_item_choices, id: :uuid do |t|
      t.string :title
      t.boolean :optional
      t.boolean :allows_multiple_selections
      t.integer :minimum_number_of_selections
      t.integer :maximum_number_of_selections
    end
  end
end
