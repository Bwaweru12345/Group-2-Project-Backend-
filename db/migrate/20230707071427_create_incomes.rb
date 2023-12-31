class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.decimal :amount
    
      t.timestamps
    end
    
  end
end
