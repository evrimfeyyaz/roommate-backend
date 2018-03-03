class CreateTemporaryTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :temporary_tokens, id: :uuid do |t|
      t.string :device_ip
      t.datetime :expires_at
      t.string :value
      t.datetime :used_at

      t.timestamps
    end
  end
end
