require 'bank'

describe Bank do
  subject(:bank) {described_class.new()}

  context 'Adding credit to the account' do

    it 'it should have a method to add the credit into the account' do
      expect{bank.add_credit(1000, '23/01/2017')}.to_not raise_error
    end

    it 'should save the added credit to an array' do
      bank.add_credit(1000, '23/01/2017')
      expect(bank.credit).to eq [1000]
    end
  end

  context 'Making withdrawals from the account' do

    it 'it should have a method to withdraw money from the account' do
      expect{bank.withdraw_money(1000, '23/01/2017')}.to_not raise_error
    end

    it 'it should save the withdrawn amount into an array' do
      bank.withdraw_money(1000, '23/01/2017')
      expect(bank.withdrawals). to eq [1000]
    end
  end

  context 'Calculating the balance' do
    it 'it should substract the total withdrawal amount from the total added credit amount' do
      bank.add_credit(1000, '23/01/2017')
      bank.withdraw_money(1000, '23/01/2017')
      expect(bank.total_balance).to eq 0
    end
  end

  context "Knowing the date of the transactions" do
    it 'it should allow to record the date of the transaction' do
      bank.add_credit(1000, '23/01/2017')
      bank.withdraw_money(500, '23/01/2017')
      expect(bank.transactions.keys).to include('23/01/2017')
    end

    it 'should display the trasactions ammounts made in that date' do
      bank.add_credit(1000, '23/01/2017')
      bank.withdraw_money(500, '23/01/2017')
      bank.add_credit(1000, '23/01/2017')
      expect(bank.transactions['23/01/2017']).to eq({:credit=>2000, :debit=>500, :balance=>1500})
    end
  end

  context 'Displays the account summary' do
    it 'should diplay the columns: data, credit, debit, balance separated by || if no transactions have been made' do
      expect{bank.display_account_summary}.to output("date       || credit     || debit      || balance    \n").to_stdout
    end

    it 'should display the transactions in ascending order wrt to date' do
      bank.add_credit(1000, '10/01/2012')
      # require 'pry';binding.pry
      expect {bank.display_account_summary}.to output("date       || credit     || debit      || balance    \n10/01/2012 || 1000       ||            || 1000       \n").to_stdout
    end
  end
end
