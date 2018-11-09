require_relative '../lib/bank_account.rb'
require_relative '../lib/account_statement.rb'

statement = AccountStatement.new
account = BankAccount.new(statement)
account.deposit(1000)
account.deposit(2000)
account.withdraw(500)
puts account.view_statement
