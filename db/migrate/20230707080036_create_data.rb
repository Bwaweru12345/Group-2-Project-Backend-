class CreateData < ActiveRecord::Migration[7.0]
  def change
    create_table :data do |t|
      t.decimal :savings
      t.decimal :locked_savings
      t.decimal :goal
      t.decimal :loan

      t.timestamps
    end
  end
end
