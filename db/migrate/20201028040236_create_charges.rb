class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.references :author, index: true
      t.string :name
      t.integer :amount

      t.timestamps
    end
    add_foreign_key :charges, :users, column: :author_id
  end
end
