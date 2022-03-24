class AddColumnProduct < ActiveRecord::Migration[6.1]
  def change
    change_table :products do |t|
      t.integer :quantity
    end
    add_reference :products, :supplier, foreign_key: true
  end
end
