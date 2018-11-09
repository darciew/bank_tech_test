# AccountStatement Class
class AccountStatement

  def format_statement(transactions)
    puts 'date || credit || debit || balance'
    transactions.each.reverse_each do |transaction|
      credit = format_amount(transaction[:credit])
      debit = format_amount(transaction[:debit])
      balance = format_amount(transaction[:balance])
      puts "#{format_date} || #{credit} || #{debit} || #{balance}"
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
