class RemoveBeginDateAndRenameEndDateInStays < ActiveRecord::Migration[5.1]
  def change
    remove_column :stays, :begin_date

    rename_column :stays, :end_date, :ended_at
    change_column :stays, :ended_at, :datetime
  end
end
