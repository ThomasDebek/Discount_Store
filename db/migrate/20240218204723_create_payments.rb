class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
