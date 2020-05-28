class CreateGivingEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :giving_events do |t|
      t.string :name
      t.integer :target_amount
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
