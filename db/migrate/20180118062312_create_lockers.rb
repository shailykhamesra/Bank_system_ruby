class CreateLockers < ActiveRecord::Migration[5.1]
  def change
    create_table :lockers do |t|
      t.integer :locker_key
      t.references :account, foreign_key: true
    end
  end
end
