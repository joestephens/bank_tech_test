require 'printer'

RSpec.describe Printer do

  subject(:printer) { described_class }

  let(:statement) { double(:statement) }
  let(:headers) { "date || credit || debit || balance\n" }

  context 'client prints statement' do

    it 'prints an empty statement when there are no transactions' do
      allow(statement).to receive(:transactions) { [] }
      expect { printer.output(statement) }.to output(headers).to_stdout
    end

    it 'shows 1 credit transaction' do
      transaction = [[Time.new(1992, 5, 18), 1000]]
      allow(statement).to receive(:transactions) { transaction }
      output = "#{headers}18/05/1992 || 1000.00 || || 1000.00\n"

      expect { printer.output(statement) }.to output(output).to_stdout
    end

    it 'shows 1 credit and 1 debit transaction in order' do
      transaction = [
        [Time.new(1992, 5, 17), 1000],
        [Time.new(1992, 5, 18), -1000]
      ]
      
      output1 = "18/05/1992 ||  || 1000.00 || 0.00\n"
      output2 = "17/05/1992 || 1000.00 || || 1000.00\n"
      output = "#{headers}#{output1}#{output2}"

      allow(statement).to receive(:transactions) { transaction }
      expect { printer.output(statement) }.to output(output).to_stdout
    end

  end

end
