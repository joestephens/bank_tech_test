require 'client'

describe Client do

  subject(:client) { described_class.new }

  context 'when a new client is created' do

    it 'they should have a starting balance of 0' do
      expect(client.balance).to eq 0
    end

  end

end
