class CreateStays < ActiveRecord::Migration[5.1]
  def change
    create_table :stays, id: :uuid do |t|
      t.string :room_number
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
