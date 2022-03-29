
require 'statement'
require 'date'

describe Statement do
  let(:date_today) { Date.today.strftime('%d/%m/%Y') }
  let(:transactions) { 
    [ 
      { type: :deposit, 
        date: date_today,
        amount: format('%.2f', 1000),
        balance: format('%.2f', 1000.00)
      }
    ]
  }

  let(:statement) { described_class.new(transactions) }

  describe '#print' do
    context 'on the account statement' do
      it 'prints the date of a single deposit (debit)' do
        # statement = Statement.new()
        expect { statement.print }.to output(
          "date || credit || debit || balance\n#{date_today} || 1000.00 ||  || 1000.00\n"
        ).to_stdout
      end
      it 'prints the amount of a single deposit (debit)' do
        expect { statement.print }.to output(
          "date || credit || debit || balance\n#{date_today} || 1000.00 ||  || 1000.00\n"
        ).to_stdout
      end
      it 'prints a deposit transaction in the debit column' do
        expect { statement.print }.to output(
          "date || credit || debit || balance\n#{date_today} || 1000.00 ||  || 1000.00\n"
        ).to_stdout
      end
      it 'prints the total balance at the time of the transaction' do
        expect { statement.print }.to output(
          "date || credit || debit || balance\n#{date_today} || 1000.00 ||  || 1000.00\n"
        ).to_stdout
      end
      it 'prints multiple deposit transactions in reverse chronological order' do
        transactions << { type: :deposit, 
                          date: date_today,
                          amount: format('%.2f', 200),
                          balance: format('%.2f', 1200.00)
        }
        expect { statement.print }.to output(
          "date || credit || debit || balance\n"\
          "#{date_today} || 200.00 ||  || 1200.00\n"\
          "#{date_today} || 1000.00 ||  || 1000.00\n"
        ).to_stdout
      end
      it 'prints both deposit and withdrawal transactions in the correct columns' do
        transactions << { type: :withdrawal, 
                          date: date_today,
                          amount: format('%.2f', 200),
                          balance: format('%.2f', 800.00)
        }
        expect { statement.print }.to output(
          "date || credit || debit || balance\n"\
          "#{date_today} ||  || 200.00 || 800.00\n"\
          "#{date_today} || 1000.00 ||  || 1000.00\n"
        ).to_stdout
      end
    end
  end
end