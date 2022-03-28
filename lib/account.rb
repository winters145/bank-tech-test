require 'date'

class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    save_deposit(amount)
  end

  def withdraw(amount)
    @balance -= amount
    save_withdrawal(amount)
  end

  def statement
    puts "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:type] == :withdrawal ? transaction[:amount] : ""} || #{transaction[:type] == :deposit ? transaction[:amount] : ""} || #{transaction[:balance]}"
    end
  end

  private

  def save_deposit(amount)
    @transactions << {type: :deposit, date: Date.today.strftime("%d/%m/%Y"), amount: '%.2f' % amount, balance: '%.2f' % @balance}
  end

  def save_withdrawal(amount)
    @transactions << {type: :withdrawal, date: Date.today.strftime("%d/%m/%Y"), amount: '%.2f' % amount, balance: '%.2f' % @balance}
  end
end