class CreateChargings < ActiveRecord::Migration[5.2]
  def change
    create_table :chargings do |t|
      t.references :charge, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
