require 'bank'

describe Bank do
  subject(:bank) {described_class.new()}

  describe 'Adding credit to the account' do
    it 'it should have a method to add the credit into the account' do
      bank.add_credit(1000).to_not raise_error
    end
  end

end
