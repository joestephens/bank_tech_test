require 'printer'

RSpec.describe Printer do

  subject(:printer) { described_class }

  let(:headers) { "date || credit || debit || balance\n" }

  context 'client prints statement' do

    it 'prints an empty statement when there are no transactions' do
      expect { printer.output([]) }.to output(headers).to_stdout
    end

    it 'shows 1 credit transaction' do
      transaction = [[Time.new(1992, 5, 18), 1000]]
      output = "#{headers}18/05/1992 || 1000.00 || || 1000.00\n"
      expect { printer.output(transaction) }.to output(output).to_stdout
    end

  end

end
