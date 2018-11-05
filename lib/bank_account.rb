class BankAccount
  attr_reader :balance, :statement
  START_BALANCE = 0

  def initialize(statement = AccountStatement.new)
    @balance = START_BALANCE
    @statement = statement
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
