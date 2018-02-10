class CreateRoomServiceItemChoiceOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :room_service_item_choice_options, id: :uuid do |t|
      t.string :title
      t.decimal :price
      t.belongs_to :room_service_item_choice, foreign_key: true, type: :uuid, index: { name: 'room_service_item_choices_on_options' }
    end
  end
end
