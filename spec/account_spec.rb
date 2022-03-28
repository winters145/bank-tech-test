require 'account'
require 'date'

describe Account do

  let(:account) { described_class.new }
  let(:date_today) { Date.today.strftime("%d/%m/%Y") }

  describe "#deposit" do
    it "deposits money to the account" do
      account.deposit(100.00)
      expect(account.balance).to eq 100.00
    end
  end

  describe "#withdraw" do
    it "withdraws money from the account" do
      account.deposit(100.00)
      account.withdraw(20.00)
      expect(account.balance).to eq 80.00
    end
  end

  describe "transactions" do
    it "records the date that a deposit was made" do
      account.deposit(100.00)
      expect(account.transactions[0][:date]).to eq date_today
    end
    it "records the date that a withdrawal was made" do
      account.deposit(100.00)
      account.withdraw(20.00)
      expect(account.transactions[1][:date]).to eq date_today
    end
    it "records the amount that was deposited" do
      account.deposit(200.00)
      expect(account.transactions[0][:amount]).to eq 200.00
    end
    it "records the amount that was withdrawn" do
      account.deposit(200.00)
      account.withdraw(100.00)
      p account.transactions
      expect(account.transactions[1][:amount]).to eq -100.00
    end
    
  end

  describe "#statement" do
    context "on the account statement" do
      it "prints the date of a single deposit (debit)" do
        account.deposit(100.00)
        expect(account.statement).to include "date || credit || debit || balance\n#{date_today}"
      end
    end
  end

end