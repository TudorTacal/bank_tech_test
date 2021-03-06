class Bank

  attr_reader :credit, :withdrawals, :transactions, :ary, :balance, :table

  def initialize
    @credit = []
    @withdrawals = []
    @transactions = Hash.new{|h,k| h[k] = {credit: 0, debit: 0}}
    @ary = []
    @balance = 0
    @table = "date".ljust(11, " ") + "|| " + "credit".ljust(11, " ")  + "|| " +
              "debit".ljust(11, " ") + "|| " + "balance".ljust(11, " ") + "\n"
;
  end

  def add_credit(amount, date)
    credit << amount
    record_transaction(date, :credit, amount )
  end

  def withdraw_money(amount, date)
    withdrawals << amount
    record_transaction(date, :debit, amount )
  end

  def total_balance
    sum_total_transactions(credit) - sum_total_transactions(withdrawals)
  end

  def display_account_summary
    save_rows_into_array
    insert_rows_into_table
    puts table
  end


  private

    def save_rows_into_array
      transactions.each do |k,v|
        transactions[k][:debit] == 0 ? debit = "" : debit = transactions[k][:debit]
        transactions[k][:credit] == 0 ? credit == "" : credit = transactions[k][:credit]
        @balance += transactions[k][:balance]
        @ary << "#{k}".ljust(11, " ") + "|| " + "#{credit}".ljust(11, " ") +  "|| " + "#{debit}".ljust(11, " ") +  "|| " + "#{@balance}".ljust(11, " ") + "\n"
      end
    end

    def insert_rows_into_table
      @ary.reverse.map do |element|
        table << element
      end
    end

    def sum_total_transactions(transaction)
      transaction.inject{|sum, elem| sum + elem}
    end

    def record_transaction(date, type, amount)
      @transactions[date][type] += amount
      @transactions[date][:balance] =   @transactions[date][:credit] - @transactions[date][:debit]
    end

end
