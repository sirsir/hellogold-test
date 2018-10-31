class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :txref
      t.string :type
      t.string :asset
      t.float :amount

      t.timestamps null: false
    end
  end
end
