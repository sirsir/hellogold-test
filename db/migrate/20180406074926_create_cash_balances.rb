class CreateCashBalances < ActiveRecord::Migration
  def change
    create_table :cash_balances do |t|
      t.float :amount
      t.references :User, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
