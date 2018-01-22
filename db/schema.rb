# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_180_118_062_312) do
  create_table 'accounts', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'account_no'
    t.decimal 'balance', precision: 10
    t.bigint 'customer_id'
    t.index ['customer_id'], name: 'index_accounts_on_customer_id'
  end

  create_table 'banks', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name'
    t.string 'address'
    t.string 'phone'
  end

  create_table 'customers', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name'
    t.string 'address'
    t.string 'phone'
    t.bigint 'bank_id'
    t.index ['bank_id'], name: 'index_customers_on_bank_id'
  end

  create_table 'loans', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'loan_type'
    t.bigint 'account_id'
    t.index ['account_id'], name: 'index_loans_on_account_id'
  end

  create_table 'lockers', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'locker_key'
    t.bigint 'account_id'
    t.index ['account_id'], name: 'index_lockers_on_account_id'
  end

  create_table 'transactions', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'account_type'
    t.bigint 'account_id'
    t.index ['account_id'], name: 'index_transactions_on_account_id'
  end

  add_foreign_key 'accounts', 'customers'
  add_foreign_key 'customers', 'banks'
  add_foreign_key 'loans', 'accounts'
  add_foreign_key 'lockers', 'accounts'
  add_foreign_key 'transactions', 'accounts'
end
