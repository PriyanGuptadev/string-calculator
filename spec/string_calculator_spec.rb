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
    it 'returns the sum of multiple comma-separated numbers' do
      expect(calculator.add("1,2,3")).to eq(6)
    end
    it 'handles negative numbers' do
      expect(calculator.add("1,-2,3")).to eq(2)
    end
    it 'handles large numbers' do
      expect(calculator.add("1000,2000,3000")).to eq(6000)
    end
    it 'returns the sum of numbers separated by commas and newlines' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end
  end
end
