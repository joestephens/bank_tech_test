require 'bank'

RSpec.describe Bank do

  subject(:bank) { described_class.new }

  context 'when a bank is created' do

    it 'it has no clients' do
      expect(bank.clients).to eq([])
    end

  end

end
