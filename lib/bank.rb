class Bank

  attr_reader :credit, :withdrawals, :transactions

  def initialize
    @credit = []
    @withdrawals = []
    @transactions = Hash.new{|h,k| h[k] = {credit: 0, debit: 0}}
  end

  def add_credit(amount, date)
    credit << amount
    record_transaction(date, :credit, amount )
  end

  def withdraw_money(amount, date)
    withdrawals << amount
    record_transaction(date, :debit, amount )
  end

  def balance
    sum_total_transactions(credit) - sum_total_transactions(withdrawals)
  end

  def display_account_summary
  'date || credit || debit || balance'
  end

  private

    def sum_total_transactions(transaction)
      transaction.inject{|sum, elem| sumn + elem}
    end

    def record_transaction(date, type, amount)
      @transactions[date][type] += amount
    end

end
