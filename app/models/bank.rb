class Bank < ApplicationRecord
  has_many :customers
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
