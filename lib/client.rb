# understands having a balance that can be changed
class Client

  attr_reader :balance, :statement

  def initialize(statement)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    add_to_statement(amount)
  end

  def withdraw(amount)
    raise(RuntimeError, 'Insufficient funds.') if amount > @balance
    @balance -= amount
    add_to_statement(amount)
  end

  private

  def add_to_statement(amount)
    @statement.add_transaction(Time.now, amount)
  end

end
