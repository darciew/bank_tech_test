require 'bank_account'
require 'account_statement'
require 'date'

describe BankAccount do
  let(:bankaccount) { described_class.new }
  let(:date) { Date.parse('15/11/2017') }

  context('Depositing money') do
    describe('#deposit') do
      let(:deposit_trans) { { date: date, credit: 150, debit: ' ', balance: 150 } }

      it('adds an amount to the existing balance') do
        bankaccount.deposit(150)
        expect(bankaccount.balance).to eq 150
      end

      it('throws an error if the amount is not a positive number') do
        err_msg = "Amount must be more than #{BankAccount::START_BALANCE}"
        expect { bankaccount.deposit(-15) }.to raise_error err_msg
      end
    end
  end

  context('Withdrawing money') do
    describe('#withdraw') do
      let(:withdraw_trans) { { date: date, credit: ' ', debit: 200, balance: 800 } }

      before(:each) do
        bankaccount.deposit(1000)
      end
      it('reduces the balance by the amount entered') do
        bankaccount.withdraw(200)
        expect(bankaccount.balance).to eq 800
      end

      it('throws an error if withdraw amount is greater than the balance') do
        err_msg = 'Error: insufficient funds'
        expect { bankaccount.withdraw(1001) }.to raise_error err_msg
        expect(bankaccount.balance).not_to eq(-1)
      end
    end
  end

  context('Viewing bank statement') do
    describe('#view_statement') do
      it('prints out a bank statement') do
        allow(Date).to receive(:today).and_return(date)
        bankaccount.deposit(1500)
        bankaccount.withdraw(200)
        expect { bankaccount.view_statement }.to output('date || credit || '\
           "debit || balance\n15/11/2017 ||  || 200 || 1300\n15/11/2017"\
           " || 1500 ||  || 1500\n").to_stdout
      end
    end
  end
end
