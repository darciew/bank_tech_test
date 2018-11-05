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
    end
  end
end
