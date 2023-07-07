class CreatePersonals < ActiveRecord::Migration[7.0]
  def change
    create_table :personals do |t|
      t.string :name
      t.decimal :amount
      t.boolean :is_paid
      t.date :due_date

      t.timestamps
    end
  end
end
