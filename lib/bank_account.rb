require 'date'

# BankAccount Class
class BankAccount
  attr_reader :balance, :statement
  START_BALANCE = 0

  def initialize(statement = AccountStatement.new)
    @balance = START_BALANCE
    @statement = statement
  end

  def deposit(amount, date = Date.today)
    raise "Amount must be more than #{START_BALANCE}" if amount.negative?

    @balance += amount
    trans_details = {
      date: date,
      credit: amount,
      balance: @balance
    }
    add_to_transactions(trans_details)
  end

  def withdraw(amount, date = Date.today)
    raise 'Error: insufficient funds' if amount > @balance

    @balance -= amount
    trans_details = {
      date: date,
      debit: amount,
      balance: @balance
    }
    add_to_transactions(trans_details)
  end

  def view_statement
    @statement.format_statement
  end

  private

  def add_to_transactions(details)
    @statement.transaction_log(details)
  end
end
