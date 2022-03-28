require 'account'

describe Account do

  describe "#deposit" do
    it "deposits money to the account" do
      account = Account.new
      account.deposit(100)
      expect(account.balance).to eq 100
    end
  end

  describe "#withdraw" do
    it "withdraws money from the account" do
      account = Account.new
      account.deposit(100)
      account.withdraw(20)
      expect(account.balance).to eq 80
    end
  end

end