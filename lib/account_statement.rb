class AccountStatement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def transaction_log(details)
    @transactions << details
  end

  def format_statement
    puts 'date || credit || debit || balance'
    @transactions.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
  end
end
