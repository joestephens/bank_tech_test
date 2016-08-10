class Statement

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(time, amount)
    @transactions << [time, amount]
  end

end
