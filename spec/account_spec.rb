require 'account'

describe Account do
  describe "#deposit" do
    it "deposits money to the account" do
      account = Account.new
      account.deposit(100)
      expect(account.balance).to eq 100
    end
  end
end