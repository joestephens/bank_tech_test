require 'bank'
require 'client'
require 'statement'

RSpec.describe 'Feature Test' do
  it 'client is created, joins a bank, makes some transactions' do
    statement = Statement.new
    client = Client.new(statement)

    expect(client.statement).to eq(statement)

    bank = Bank.new
    bank.add_client(client)

    expect(bank.clients).to include(client)

    allow(Time).to receive(:now).and_return(123456789)
    client.deposit(1000)

    expect(statement.transactions).to include([123456789, 1000])
  end
end
