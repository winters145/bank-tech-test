class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << {type: :deposit, date: Date.today.strftime("%d/%m/%Y"), amount: amount}
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << {type: :withdrawal, date: Date.today.strftime("%d/%m/%Y"), amount: -amount}
  end

  def statement
    "balance\n£#{@balance}"
    "date || credit || debit || balance\n"
  end

end