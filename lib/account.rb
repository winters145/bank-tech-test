class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << {type: :deposit, date: Date.today.strftime("%d/%m/%Y"), amount: '%.2f' % amount}
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << {type: :withdrawal, date: Date.today.strftime("%d/%m/%Y"), amount: '%.2f' % amount}
  end

  def statement
    "date || credit || debit || balance\n#{@transactions[-1][:date]} || #{@transactions[-1][:amount]}"
  end

end