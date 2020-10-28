class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.references :author, index: true
      t.string :name

      t.timestamps
    end
    add_foreign_key :groups, :users, column: :author_id
  end
end
