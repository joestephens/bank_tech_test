# understands storing transactions
class Statement

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(time, amount)
    transaction = [time, amount]
    @transactions << transaction
    transaction
  end

end
