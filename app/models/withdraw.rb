class Withdraw < Transaction
	def apply!
    raise "Insufficient balance" if account.balance < amount
    account.balance -= amount
  end
end