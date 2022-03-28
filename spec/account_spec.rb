# frozen_string_literal: true

require 'account'
require 'date'

describe Account do
  let(:account) { described_class.new }
  let(:date_today) { Date.today.strftime('%d/%m/%Y') }

  describe '#deposit' do
    it 'deposits money to the account' do
      account.deposit(100.00)
      expect(account.balance).to eq 100.00
    end
  end

  describe '#withdraw' do
    it 'withdraws money from the account' do
      account.deposit(100.00)
      account.withdraw(20.00)
      expect(account.balance).to eq 80.00
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

  describe '#statement' do
    context 'on the account statement' do
      it 'prints the date of a single deposit (debit)' do
        account.deposit(1000.00)
        expect { account.statement }.to output(
          "date || credit || debit || balance\n#{date_today} ||  || 1000.00 || 1000.00\n"
        ).to_stdout
      end
      it 'prints the amount of a single deposit (debit)' do
        account.deposit(1000.00)
        expect { account.statement }.to output(
          "date || credit || debit || balance\n#{date_today} ||  || 1000.00 || 1000.00\n"
        ).to_stdout
      end
      it 'prints a deposit transaction in the debit column' do
        account.deposit(1000.00)
        expect { account.statement }.to output(
          "date || credit || debit || balance\n#{date_today} ||  || 1000.00 || 1000.00\n"
        ).to_stdout
      end
      it 'prints the total balance at the time of the transaction' do
        account.deposit(1000.00)
        expect { account.statement }.to output(
          "date || credit || debit || balance\n#{date_today} ||  || 1000.00 || 1000.00\n"
        ).to_stdout
      end
      it 'prints multiple deposit transactions in reverse chronological order' do
        account.deposit(300.00)
        account.deposit(200.00)
        expect { account.statement }.to output(
          "date || credit || debit || balance\n"\
          "#{date_today} ||  || 200.00 || 500.00\n"\
          "#{date_today} ||  || 300.00 || 300.00\n"
        ).to_stdout
      end
      it 'prints both deposit and withdrawal transactions in the correct columns' do
        account.deposit(400)
        account.withdraw(100)
        account.deposit(200)
        expect { account.statement }.to output(
          "date || credit || debit || balance\n"\
          "#{date_today} ||  || 200.00 || 500.00\n"\
          "#{date_today} || 100.00 ||  || 300.00\n"\
          "#{date_today} ||  || 400.00 || 400.00\n"
        ).to_stdout
      end
    end
  end
end
