require 'statement'

RSpec.describe Statement do

  subject(:statement) { described_class.new }

  context 'when a statement is initialised' do

    it 'has no transactions' do
      expect(statement.transactions).to eq([])
    end

  end

  context 'when a client makes a transaction' do

    it 'it is added to their statement' do
      now = Time.now
      statement.add_transaction(now, 1000)
      expect(statement.transactions).to include([now, 1000])
    end
    
  end

end
