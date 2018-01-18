class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :account_no
      t.decimal :balance
      t.references :customer, foreign_key: true
    end
  end
end
