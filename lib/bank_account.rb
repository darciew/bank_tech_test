class BankAccount
  attr_reader :balance
  START_BALANCE = 0

  def initialize
    @balance = START_BALANCE
  end

  def deposit(amount)
    raise "Amount must be more than #{START_BALANCE}" if amount.negative?

    @balance += amount
  end

  def withdraw(amount)
    raise 'Error: insufficient funds' if amount > @balance

    @balance -= amount
  end
end
