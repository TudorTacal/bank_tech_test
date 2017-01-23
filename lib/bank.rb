class Bank

  attr_reader :credit, :withdrawals, :transactions

  def initialize
    @credit = []
    @withdrawals = []
    @transactions = Hash.new{|h,k| h[k] = {credit: 0, debit: 0}}
  end

  def add_credit(amount, date)
    credit << amount
    @transactions["#{date}"][:credit] += amount
  end

  def withdraw_money(amount, date)
    withdrawals << amount
    @transactions["#{date}"][:debit] += amount
  end

  def balance
    sum_total_transactions(credit) - sum_total_transactions(withdrawals)
  end

  private

    def sum_total_transactions(transaction)
      transaction.inject{|sum, elem| sumn + elem}
    end

end
