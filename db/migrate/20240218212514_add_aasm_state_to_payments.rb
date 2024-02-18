class AddAasmStateToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :aasm_state, :string
  end
end
