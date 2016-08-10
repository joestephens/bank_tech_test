require 'client'

RSpec.describe Client do

  subject(:client) { described_class.new(statement) }

  let(:statement) { double(:statement) }

  context 'when a new client is created' do

    it 'they should have a starting balance of 0' do
      expect(client.balance).to eq(0)
    end

    it 'they should have a statement' do
      expect(client.statement).to eq(statement)
    end

  end

  context 'when a client wants to adjust their balance' do

    it 'they can make a deposit' do
      allow(statement).to receive(:add_transaction) { [Time.now, 1000] }
      client.deposit(1000)

      expect(statement).to respond_to(:add_transaction).with(2).argument
      expect(client.balance).to eq(1000)
    end

    it 'they can make a withdrawal' do
      allow(statement).to receive(:add_transaction) { [Time.now, 1000] }

      client.deposit(1000)
      client.withdraw(750)

      expect(statement).to respond_to(:add_transaction).with(2).argument
      expect(client.balance).to eq(250)
    end

    it 'they can\'t make a withdrawal if they don\'t have enough money' do
      allow(statement).to receive(:add_transaction) { [Time.now, 500] }

      client.deposit(500)

      error = 'Insufficient funds.'
      expect { client.withdraw(600) }.to raise_error(RuntimeError, error)
    end

  end

end
