class Customer < ApplicationRecord
  belongs_to :bank
  has_many :accounts
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
