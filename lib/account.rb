# frozen_string_literal: true

require 'date'

# Bank account class for processing transactions and statements
class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    check_correct_input(amount)
    @balance += amount
    save_transaction(:deposit, amount)
  end

  def withdraw(amount)
    check_correct_input(amount)
    @balance -= amount
    save_transaction(:withdrawal, amount)
  end

  def statement
    puts 'date || credit || debit || balance'
    @transactions.reverse.each do |transaction|
      puts "#{transaction[:date]} || "\
      "#{transaction[:type] == :withdrawal ? transaction[:amount] : ''} || "\
      "#{transaction[:type] == :deposit ? transaction[:amount] : ''} || "\
      "#{transaction[:balance]}"
    end
  end

  private

  def check_correct_input(amount)
    raise 'Invalid input: please enter a number' unless amount.is_a?(Integer) || amount.is_a?(Float)
  end

  def save_transaction(type, amount)
    @transactions << { type: type, 
                       date: Date.today.strftime('%d/%m/%Y'),
                       amount: format('%.2f', amount),
                       balance: format('%.2f', @balance) }
  end

end
