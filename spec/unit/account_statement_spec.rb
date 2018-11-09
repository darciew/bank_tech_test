require 'account_statement'
require 'date'

describe AccountStatement do
  let(:accountstatement) { described_class.new }
  let(:date) { Date.parse('15/11/2017') }

  context('Formatting transactions') do
    describe('format_statement') do
      it('formats a statement when a deposit is made') do
        allow(Date).to receive(:today).and_return(date)
        account = double('account')
        expect(account).to receive(:transactions).and_return(
          [
            { date: date, credit: 150.00, balance: 150.00 }
          ]
        )
        expect { accountstatement.format_statement(account.transactions) }.to output('date || credit || '\
          "debit || balance\n15/11/2017 || 150.00 ||  || 150.00\n").to_stdout
      end

      it('formats a statement when a withdrawal is made') do
        allow(Date).to receive(:today).and_return(date)
        account = double('account')
        expect(account).to receive(:transactions).and_return(
          [
            { date: date, credit: 150.00, balance: 150.00 },
            { date: date, debit: 50.00, balance: 100.00 }
          ]
        )
        expect { accountstatement.format_statement(account.transactions) }.to output('date || credit || '\
          "debit || balance\n15/11/2017 ||  || 50.00 || 100.00\n15/11/2017 || 150.00 ||  || 150.00\n").to_stdout
      end
    end
  end
end
