# AccountStatement Class
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
    @transactions.each.reverse_each do |transaction|
      puts "#{format_date} || #{format_amount(transaction[:credit])} || #{format_amount(transaction[:debit])} || #{format_amount(transaction[:balance])}"
    end
  end

  private

  def format_date
    Date.today.strftime('%d/%m/%Y')
  end

  def format_amount(amount)
    format('%.2f', amount) unless amount.nil?
  end
end
