class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels, id: :uuid do |t|
      t.string :name
      t.string :time_zone
      t.string :currency
    end
  end
end
