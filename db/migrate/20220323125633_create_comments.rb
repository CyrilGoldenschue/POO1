class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :target_id
      t.string :target_type
    end
    add_reference :comments, :author, references: :users
  end
end
