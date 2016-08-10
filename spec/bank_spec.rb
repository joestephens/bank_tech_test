require 'bank'

RSpec.describe Bank do

  subject(:bank) { described_class.new }

  let(:client) { double(:client) }

  context 'when a bank is created' do

    it 'it has no clients' do
      expect(bank.clients).to eq([])
    end

  end

  context 'when somebody wants to join the bank' do

    it 'the bank can add them as a client' do
      bank.add_client(client)
      expect(bank.clients).to eq([client])
    end

  end

end
