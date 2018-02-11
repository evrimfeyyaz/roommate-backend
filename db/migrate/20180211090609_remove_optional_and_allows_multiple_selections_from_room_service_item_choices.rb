class RemoveOptionalAndAllowsMultipleSelectionsFromRoomServiceItemChoices < ActiveRecord::Migration[5.1]
  def change
    remove_column :room_service_item_choices, :optional
    remove_column :room_service_item_choices, :allows_multiple_selections
  end
end
