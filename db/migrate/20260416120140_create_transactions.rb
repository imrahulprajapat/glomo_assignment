class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.decimal :amount, precision: 15, scale: 2, null: false
      t.string :type, null: false
      t.string :state, null: false

      t.index :type
      t.index :state

      t.timestamps
    end
  end
end
