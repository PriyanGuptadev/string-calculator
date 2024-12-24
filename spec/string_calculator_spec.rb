require_relative '../string_calculator'

RSpec.describe 'StringCalculator' do
  let(:calculator) { StringCalculator.new }
  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add("")).to eq(0)
    end
    it 'returns the number for a single number' do
      expect(calculator.add("5")).to eq(5)
    end
    it 'returns the sum of two comma-separated numbers' do
      expect(calculator.add("2,3")).to eq(5)
    end
  end
end