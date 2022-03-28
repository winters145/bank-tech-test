require 'date'
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

  describe "I'd like to keep track of my transactions" do
    context "on an account statement" do

      xit "includes one deposit transaction on the statement" do
        account = Account.new
        date = Date.today.strftime("%d/%m/%Y")
        account.deposit(100)
        account.withdraw(20)
        expect { account.statement }.to output(
          "date || credit || debit || balance\n#{date} ||  || 100.00 || 100.00"
        ).to_stdout
      end
    end

  end
end