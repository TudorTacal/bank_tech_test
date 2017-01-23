require 'bank'

describe Bank do
  subject(:bank) {described_class.new()}

  context 'Adding credit to the account' do

    it 'it should have a method to add the credit into the account' do
      expect{bank.add_credit(1000)}.to_not raise_error
    end

    it 'should save the added credit to an array' do
      bank.add_credit(1000)
      expect(bank.credit).to eq [1000]
    end

  end

end
