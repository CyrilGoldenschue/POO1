class CreateClient < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :firstname, :lastname, null: true
    end
  end
end
