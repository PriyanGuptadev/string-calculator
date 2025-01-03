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
      expect { calculator.add("1,-2,3") }.to raise_error("negative numbers not allowed -2")
    end
    it 'handles large numbers' do
      expect(calculator.add("1000,2000,3000")).to eq(6000)
    end
    it 'returns the sum of numbers separated by commas and newlines' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end
    it 'returns the sum of numbers with a custom delimiter' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end
    it 'raises an exception when multiple negative numbers are passed' do
      expect { calculator.add("-1,2,-3") }.to raise_error("negative numbers not allowed -1, -3")
    end
  end
end
