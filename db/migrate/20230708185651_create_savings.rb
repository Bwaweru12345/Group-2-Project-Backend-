class CreateSavings < ActiveRecord::Migration[7.0]
  def change
    create_table :savings do |t|
      t.integer :user_id, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.timestamps
    end

    add_index :savings, :user_id
  end
end