require 'bank_account'

describe BankAccount do
  let(:bankaccount) { described_class.new }

  context('A new bank account') do
    describe('#initialize') do
      it('starts with a balance of zero') do
        expect(bankaccount.balance).to eq 0
      end
    end
  end

  context('Depositing money') do
    describe('#deposit') do
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
      it('reduces the balance by the amount entered') do
        bankaccount.deposit(1000)
        bankaccount.withdraw(200)
        expect(bankaccount.balance).to eq 800
      end

      it('throws an error if withdraw amount is greater than the balance') do
        bankaccount.deposit(1000)
        err_msg = 'Error: insufficient funds'
        expect { bankaccount.withdraw(1001) }.to raise_error err_msg
        expect(bankaccount.balance).not_to eq(-1)
      end
    end
  end
end
