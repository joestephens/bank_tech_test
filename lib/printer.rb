class Printer

  def self.output(transactions)
    puts("date || credit || debit || balance")

    transactions.each do |transaction|
      date = transaction[0]
      amount = sprintf('%.2f', transaction[1])

      puts("#{ date.strftime("%d/%m/%Y") } || #{amount} || || #{amount}")
    end
  end

end
