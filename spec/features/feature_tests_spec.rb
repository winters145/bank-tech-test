describe "Feature-tests" do 

  describe "I'd like to be able to make a deposit to my account" do 
    it "deposits money to the account" do
      account = Account.new
      account.deposit(100)
      expect(account.balance).to eq 100
    end
  end

end