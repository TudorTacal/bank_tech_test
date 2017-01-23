class Bank

  attr_reader :credit

  def initialize
    @credit = []
  end

  def add_credit(amount)
    credit << amount
  end

  

end
