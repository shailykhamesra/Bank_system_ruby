class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.column :account_type ,:integer
      t.references :account, foreign_key: true
    end
  end
end
