class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.string :state
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
