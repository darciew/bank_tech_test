require 'account_statement'
require 'date'

describe AccountStatement do
  let(:accountstatement) { described_class.new }
  let(:date) { Date.parse('15/11/2017') }
  let(:deposit_trans) { { date: date, credit: 150, debit: '-', balance: 150 } }
  let(:withdraw_trans) { { date: date, credit: '-', debit: 150, balance: 0 } }

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
        allow(Date).to receive(:today).and_return(date)
        accountstatement.transaction_log(deposit_trans)
        expect(accountstatement.transactions).to include { deposit_trans }
      end

      it('logs a withdraw transaction') do
        allow(Date).to receive(:today).and_return(date)
        accountstatement.transaction_log(withdraw_trans)
        expect(accountstatement.transactions).to include { withdraw_trans }
      end
    end
  end

  context('Formatting transactions') do
    describe('format_statement') do
      it('formats a statement') do
        allow(Date).to receive(:today).and_return(date)
        accountstatement.transaction_log(deposit_trans)
        format_view = 'date || credit || debit || balance' + "\n" '2017-11-15 || 150 || - || 150' + "\n"
        expect { accountstatement.format_statement }.to output(format_view).to_stdout
      end
    end
  end
end
