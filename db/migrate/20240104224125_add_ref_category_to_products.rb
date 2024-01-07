class AddRefCategoryToProducts < ActiveRecord::Migration[7.0]
  def up
    add_reference(:products, :category, null: true, foreign_key: true)
  end

  def down
    remove_reference(:products, :category)
  end
end
