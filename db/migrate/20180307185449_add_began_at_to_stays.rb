class AddBeganAtToStays < ActiveRecord::Migration[5.1]
  def change
    add_column :stays, :began_at, :datetime
  end
end
