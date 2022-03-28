require 'date'

class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << {type: :deposit, date: Date.today.strftime("%d/%m/%Y"), amount: '%.2f' % amount, balance: '%.2f' % @balance}
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << {type: :withdrawal, date: Date.today.strftime("%d/%m/%Y"), amount: '%.2f' % amount, balance: '%.2f' % @balance}
  end

  def statement
    puts "date || credit || debit || balance"
    @transactions.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:type] == :withdrawal ? transaction[:amount] : ""} || #{transaction[:type] == :deposit ? transaction[:amount] : ""} || #{transaction[:balance]}"
    end
    # puts "date || credit || debit || balance\n#{@transactions[-1][:date]} || #{@transactions[-1][:type] == :withdrawal ? @transactions[-1][:amount] : ""} || #{@transactions[-1][:amount]} || #{@transactions[-1][:balance]}"
    # "date || credit || debit || balance\n#{@transactions[-1][:date]} || #{@transactions[-1][:type] == :withdrawal ? @transactions[-1][:amount] : ""} || #{@transactions[-1][:amount]} || #{@transactions[-1][:balance]}"
  end


end