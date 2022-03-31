# frozen_string_literal: true

require_relative './statement'
require 'date'

# Bank account class for processing transactions and statements
class Account
  attr_reader :balance, :transactions

  def initialize(statement = Statement.new)
    @statement = statement
    @transactions = []
    @balance = 0
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

  def print_statement
    @statement.print(@transactions)
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
