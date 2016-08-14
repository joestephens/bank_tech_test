class Printer

  def self.output(statement)
    puts("date || credit || debit || balance")

    balance = 0
    output = []

    statement.transactions.each do |transaction|
      date = transaction[0]
      amount = transaction[1]
      balance += amount

      output << [date, credit(amount), debit(amount), format(balance)]
    end

    sorted_output = sort_by_date_desc(output)

    sorted_output.each do |transaction|
      puts("#{transaction[0].strftime("%d/%m/%Y")} ||#{transaction[1]} ||#{transaction[2]} ||#{transaction[3]}")
    end
  end

  private

  def self.credit(amount)
    amount >= 0 ? format(amount) : ""
  end

  def self.debit(amount)
    amount < 0 ? format(amount.abs) : ""
  end

  def self.format(amount)
    sprintf(' %.2f', amount)
  end

  def self.sort_by_date_desc(transactions)
    transactions.sort do |a, b|
      b[0] <=> a[0]
    end
  end
end
