class Bank

  attr_reader :credit, :withdrawals

  def initialize
    @credit = []
    @withdrawals = []
  end

  def add_credit(amount)
    credit << amount
  end

  def withdraw_money(amount)
    withdrawals << amount
  end

  def balance
    sum_total_transactions(credit) - sum_total_transactions(withdrawals)
  end

  private

    def sum_total_transactions(transaction)
      transaction.inject{|sum, elem| sumn + elem}
    end

end
