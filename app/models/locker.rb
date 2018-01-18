class Locker < ApplicationRecord
  belongs_to :account
  validates :locker_key, presence: true, length: { minimum: 4, maximum:4}
end
