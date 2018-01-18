class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.references :bank, foreign_key: true
    end
  end
end
