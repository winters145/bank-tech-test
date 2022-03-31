class Statement

  def print(transactions)
    puts 'date || credit || debit || balance'
    transactions.reverse.each do |transaction|
      puts "#{transaction[:date]} || "\
      "#{transaction[:type] == :deposit ? transaction[:amount] : ''} || "\
      "#{transaction[:type] == :withdrawal ? transaction[:amount] : ''} || "\
      "#{transaction[:balance]}"
    end
  end

end
