# frozen_string_literal: true

require 'account'
require 'date'

describe Account do

  let(:account) { described_class.new }
  let(:date_today) { Date.today.strftime('%d/%m/%Y') }

  describe '#deposit' do

    it 'adds money to the account balance' do
      account.deposit(100.00)
      expect(account.balance).to eq 100.00
    end

    it 'throws an error if input is not an integer' do
      expect { account.deposit('fifty') }.to raise_error 'Invalid input: please enter a number'
    end

  end

  describe '#withdraw' do

    it 'deducts money from the account balance' do
      account.deposit(100.00)
      account.withdraw(20.00)
      expect(account.balance).to eq 80.00
    end

    it 'throws an error if input is not an integer' do
      expect { account.withdraw('fifty') }.to raise_error 'Invalid input: please enter a number'
    end

  end

  describe 'transactions' do

    it 'records the date that a deposit was made' do
      account.deposit(100.00)
      expect(account.transactions[0][:date]).to eq date_today
    end

    it 'records the date that a withdrawal was made' do
      account.deposit(100.00)
      account.withdraw(20.00)
      expect(account.transactions[1][:date]).to eq date_today
    end

    it 'records the amount that was deposited' do
      account.deposit(200.00)
      expect(account.transactions[0][:amount]).to eq '200.00'
      expect(account.transactions[0][:type]).to eq :deposit
    end

    it 'records the amount that was withdrawn' do
      account.deposit(200.00)
      account.withdraw(100.00)
      expect(account.transactions[1][:type]).to eq :withdrawal
      expect(account.transactions[1][:amount]).to eq '100.00'
    end

  end

  describe '#print_statement' do

    it 'prints a list of the accounts transactions' do
      account.deposit(1000)
      account.withdraw(200)
      account.deposit(50)
      statement = double("statement", print: "date || credit || debit || balance\n"\
      "#{date_today} || 50.00 ||  || 850.00\n"\
      "#{date_today} ||  || 200.00 || 800.00\n"\
      "#{date_today} || 1000.00 ||  || 1000.00\n")
      account_1 = Account.new(statement)
      expect(account_1.print_statement).to eq(
          "date || credit || debit || balance\n"\
          "#{date_today} || 50.00 ||  || 850.00\n"\
          "#{date_today} ||  || 200.00 || 800.00\n"\
          "#{date_today} || 1000.00 ||  || 1000.00\n"
        )
    end

  end

end
