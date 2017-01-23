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
    credit.inject{|sum, elem| sum + elem } - withdrawals.inject{|sum, elem| sum + elem}
  end

end
