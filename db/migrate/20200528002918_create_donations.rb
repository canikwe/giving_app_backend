class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.integer :amount
      t.integer :donor_id
      t.integer :giving_event_id

      t.timestamps
    end
  end
end
