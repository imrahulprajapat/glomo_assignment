class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :pin, null: false

      t.index :email, unique: true

      t.timestamps
    end
  end
end
