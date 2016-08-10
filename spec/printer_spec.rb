require 'printer'

describe Printer do

  subject(:printer) { described_class.new }

  context 'when initialised' do

    it 'it has no transactions' do
      expect(printer.transactions).to eq([])
    end

  end

end
