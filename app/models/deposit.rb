class Deposit < Transaction
	def apply!
    account.balance += amount
  end
end