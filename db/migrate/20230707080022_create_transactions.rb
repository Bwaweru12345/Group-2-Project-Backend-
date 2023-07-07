class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.boolean :deposited
      t.decimal :amount
      t.string :recipient

      t.timestamps
    end
  end
end
