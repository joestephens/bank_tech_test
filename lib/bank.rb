# understands having clients
class Bank

  attr_reader :clients

  def initialize
    @clients = []
  end

  def add_client(client)
    @clients << client
  end

end
