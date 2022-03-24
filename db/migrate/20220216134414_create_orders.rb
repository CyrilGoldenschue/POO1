class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :created_at
      t.date :shipped_at
      t.string :status
    end
    add_reference :orders, :client, foreign_key: true
  end
end
