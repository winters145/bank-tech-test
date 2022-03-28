describe "Feature-tests" do 

  describe "I'd like to be able to make a deposit to my account" do 
    it "adds money to the balance of the account" do
      account = Account.new
      account.deposit(100)
      expect(account.balance).to eq 100
    end
  end

  describe "I'd like to be able to make a withdrawal from my account" do
    it "deducts money from the balance of the account" do
      account = Account.new
      account.deposit(100)
      account.withdraw(20)
      expect(account.balance).to eq 80
    end
  end

  describe "I'd like to see how much money I have on my account statement" do
    it "prints a statement showing the balance" do
      account = Account.new
      account.deposit(100)
      account.withdraw(20)
      expect(account.statement).to eq "balance\n£80"
    end
  end

end