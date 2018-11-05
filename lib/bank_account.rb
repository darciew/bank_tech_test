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
    trans_details = { credit: 0, debit: amount, balance: @balance }
    add_to_transactions(trans_details)
  end

  def withdraw(amount)
    raise 'Error: insufficient funds' if amount > @balance

    @balance -= amount
    trans_details = { credit: amount, debit: 0, balance: @balance }
    add_to_transactions(trans_details)
  end

  private

  def add_to_transactions(details)
    @statement.transaction_log(details)
  end
end
