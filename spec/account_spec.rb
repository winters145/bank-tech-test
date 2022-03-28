require 'account'

describe Account do

  let(:account) { described_class.new }

  describe "#deposit" do
    it "deposits money to the account" do
      account.deposit(100)
      expect(account.balance).to eq 100
    end
  end

  describe "#withdraw" do
    it "withdraws money from the account" do
      account.deposit(100)
      account.withdraw(20)
      expect(account.balance).to eq 80
    end
  end

  describe "#statement" do
    it "prints the current balance of the account" do
      account.deposit(100)
      account.withdraw(20)
      expect(account.statement).to eq "balance\n£80"
    end
  end

end