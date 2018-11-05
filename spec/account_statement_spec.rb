require 'account_statement'

describe AccountStatement do
  let(:accountstatement) { described_class.new }

  context('A new account statement') do
    describe('#initialize') do
      it('starts with an empty transactions array') do
        expect(accountstatement.transactions).to eq []
      end
    end
  end
end
