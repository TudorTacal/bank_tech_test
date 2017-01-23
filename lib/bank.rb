class Bank

  attr_reader :credit

  def initialize
    @credit = []
  end

  def add_credit(amount)
    credit << amount
  end

  def withdraw_money(amount)

  end

end
