class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :balance, precision: 15, scale: 2, default: 0, null: false
      t.decimal :locked_balance, precision: 15, scale: 2, default: 0, null: false

      t.timestamps
    end
  end
end
