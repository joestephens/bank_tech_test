# understands having a balance that can be changed
class Client

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise(RuntimeError, 'Insufficient funds.') if amount > @balance
    @balance -= amount
  end

end
