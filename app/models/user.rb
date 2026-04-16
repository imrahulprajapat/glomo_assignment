class User < ApplicationRecord
	has_one :account, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :pin, presence: true
end
