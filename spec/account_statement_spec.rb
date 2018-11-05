require 'account_statement'

describe AccountStatement do
  let(:accountstatement) { described_class.new }
  let(:deposit_trans) { { credit: 0, debit: 150, balance: 150 } }
  let(:withdraw_trans) { { credit: 150, debit: 0, balance: 0 } }

  context('A new account statement') do
    describe('#initialize') do
      it('starts with an empty transactions array') do
        expect(accountstatement.transactions).to eq []
      end
    end
  end

  context('Logging transactions') do
    describe('#transaction_log') do
      it('logs a deposit transaction') do
        accountstatement.transaction_log(deposit_trans)
        expect(accountstatement.transactions).to include { deposit_trans }
      end

      it('logs a withdraw transaction') do
        accountstatement.transaction_log(withdraw_trans)
        expect(accountstatement.transactions).to include { withdraw_trans }
      end
    end
  end
end
