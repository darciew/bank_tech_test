class AccountStatement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def transaction_log(details)
    @transactions << details
  end
end
