require 'account_statement'

describe AccountStatement do
  let(:accountstatement) { described_class.new }
  let(:deposit_trans) { { credit: 0, debit: 150, balance: 150 } }

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
        expect(accountstatement.transactions).to eq [deposit_trans]
      end
    end
  end
end
