require 'account'
require 'date'

describe Account do

  let(:account) { described_class.new }

  describe "#deposit" do
    it "deposits money to the account" do
      account.deposit(100)
      expect(account.balance).to eq 100
    end
    it "saves the date that the deposit was made" do
      date = Date.today.strftime("%d/%m/%Y")
      account.deposit(100)
      expect(account.transactions[0][:date]).to eq date
    end
  end

  describe "#withdraw" do
    it "withdraws money from the account" do
      account.deposit(100)
      account.withdraw(20)
      expect(account.balance).to eq 80
    end
  end

  xdescribe "#statement" do
    it "prints the current balance of the account" do
      account.deposit(100)
      account.withdraw(20)
      expect(account.statement).to include "balance\n£80"
    end
    it "prints the date of a withdrawal (debit)" do
      date = Date.today.strftime("%d/%m/%Y")
      account.deposit(100)
      expect(account.statement).to include "date || credit || debit || balance\n#{date}"
    end
  end

end