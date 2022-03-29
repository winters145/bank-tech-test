class Statement

  def initialize(transactions)
    @transactions = transactions
  end

  def print
    puts 'date || credit || debit || balance'
    @transactions.reverse.each do |transaction|
      puts "#{transaction[:date]} || "\
      "#{transaction[:type] == :withdrawal ? transaction[:amount] : ''} || "\
      "#{transaction[:type] == :deposit ? transaction[:amount] : ''} || "\
      "#{transaction[:balance]}"
    end
  end

end