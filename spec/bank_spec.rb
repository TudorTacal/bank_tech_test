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
      expect(bank.balance).to eq 0
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
      expect(bank.transactions['23/01/2017']).to eq({credit: 2000, debit: 500})
    end
  end

  context 'Displays the account summary' do
    it 'should contain the columns: data, credit, debit, balance separated by ||' do
      expect(bank.account_summary).to eq 'date || credit || debit || balance'
    end
  end
end
