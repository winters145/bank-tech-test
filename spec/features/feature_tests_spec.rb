require 'date'
describe 'Feature-tests' do
  describe "I'd like to be able to make a deposit to my account" do
    it 'adds money to the balance of the account' do
      account = Account.new
      account.deposit(100)
      expect(account.balance).to eq 100
    end
  end

  describe "I'd like to be able to make a withdrawal from my account" do
    it 'deducts money from the balance of the account' do
      account = Account.new
      account.deposit(100)
      account.withdraw(20)
      expect(account.balance).to eq 80
    end
  end

  describe "I'd like to keep track of my transactions" do
    it 'prints a list of all transaction on the account' do
      account = Account.new
      date = Date.today.strftime('%d/%m/%Y')
      account.deposit(1000)
      account.withdraw(200)
      account.deposit(50)
      expect { account.statement }.to output(
        "date || credit || debit || balance\n#{date} ||  || 50.00 || 850.00\n#{date} || 200.00 ||  || 800.00\n#{date} ||  || 1000.00 || 1000.00\n"
      ).to_stdout
    end
  end
end
