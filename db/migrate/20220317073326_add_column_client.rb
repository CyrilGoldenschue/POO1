class AddColumnClient < ActiveRecord::Migration[6.1]
  def change
    change_table :clients do |t|
      t.string :name, null: true
      t.string :type
    end
  end
end
