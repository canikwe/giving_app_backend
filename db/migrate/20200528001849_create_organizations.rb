class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :admin_id

      t.timestamps
    end
  end
end
