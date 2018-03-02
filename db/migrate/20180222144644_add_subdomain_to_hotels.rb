class AddSubdomainToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :subdomain, :string
  end
end
