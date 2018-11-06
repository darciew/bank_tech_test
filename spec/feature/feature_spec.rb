require 'bank_account'
require 'account_statement'

describe 'Features' do
  context('Transactions') do
    describe('Deposit') do
      it('can deposit money in User\'s account') do
        account = BankAccount.new
        account.deposit(50)

        expect(account.balance).to eq 50
      end
    end

    describe('Withdraw') do
      it('can withdraw money from User\'s account') do
        account = BankAccount.new
        account.deposit(150)
        account.withdraw(50)

        expect(account.balance).to eq 100
      end
    end
  end

  context('Statement') do
    describe('View Statement') do
      it('can display the User\'s account statement') do
        account = BankAccount.new
        account.deposit(150)
        account.withdraw(50)

        expect { account.view_statement }.to output('date || credit || '\
           "debit || balance\n06/11/2018 || - || 50 || 100\n06/11/2018"\
           " || 150 || - || 150\n").to_stdout
      end
    end
  end
end
