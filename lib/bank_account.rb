require 'date'

# BankAccount Class
class BankAccount
  attr_reader :balance
  START_BALANCE = 0

  def initialize(statement = AccountStatement.new)
    @balance = START_BALANCE
    @statement = statement
    @transactions = []
  end

  def deposit(amount)
    raise "Amount must be more than #{START_BALANCE}" if amount.negative?

    @balance += amount
    trans_details = {
      credit: amount,
      balance: @balance
    }
    add_to_transactions(trans_details)
  end

  def withdraw(amount)
    raise 'Error: insufficient funds' if amount > @balance

    @balance -= amount
    trans_details = {
      debit: amount,
      balance: @balance
    }
    add_to_transactions(trans_details)
  end

  def view_statement
    @statement.format_statement(@transactions)
  end

  private

  def add_to_transactions(details)
    @transactions.push(details)
  end
end
