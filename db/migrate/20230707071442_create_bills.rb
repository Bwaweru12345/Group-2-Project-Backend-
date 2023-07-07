class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.string :name
      t.decimal :amount
      t.boolean :is_paid
      t.date :due_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
