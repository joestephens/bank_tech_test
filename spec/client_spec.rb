require 'client'

RSpec.describe Client do

  subject(:client) { described_class.new }

  context 'when a new client is created' do

    it 'they should have a starting balance of 0' do
      expect(client.balance).to eq(0)
    end

  end

  context 'when a client wants to adjust their balance' do

    it 'they can make a deposit' do
      client.deposit(1000)
      expect(client.balance).to eq(1000)
    end

  end

end
