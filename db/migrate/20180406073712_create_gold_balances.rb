class CreateGoldBalances < ActiveRecord::Migration
  def change
    create_table :gold_balances do |t|
      t.float :amount
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
