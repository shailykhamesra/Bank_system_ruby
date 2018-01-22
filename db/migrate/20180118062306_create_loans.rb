class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.column :loan_type, :integer
      t.references :account, foreign_key: true
    end
  end
end
