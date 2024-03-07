require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.new.add("").to_i).to eq(0)
    end

    it 'returns the sum of two numbers' do
      expect(StringCalculator.new.add("1,5").to_i).to eq(6)
    end

    it 'returns the sum of three numbers' do
      expect(StringCalculator.new.add("1,2,3").to_i).to eq(6)
    end

    it 'handles new lines between numbers' do
      expect(StringCalculator.new.add("1\n2,3").to_i).to eq(6)
    end

    it 'supports different delimiters' do
      expect(StringCalculator.new.add("//;\n1;2;3").to_i).to eq(6)
    end

    context 'when negative numbers are present' do
      it 'raises an exception if a negative number is present' do
        expect { StringCalculator.new.add("-1") }.to output("Negative numbers not allowed: -1\n").to_stdout
      end

      it 'includes the negative numbers in the exception message' do
        expect { StringCalculator.new.add("-1,2,-3") }.to output("Negative numbers not allowed: -1, -3\n").to_stdout
      end
    end
  end

  describe '#parse_input' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.new.parse_input("")).to eq(0)
    end

    it 'returns the sum of numbers in the input string' do
      expect(StringCalculator.new.parse_input("1,2,3")).to eq(6)
    end

    context 'when negative numbers are present' do
      it 'raises an exception if a negative number is present' do
        expect { StringCalculator.new.parse_input("-1") }.to output("Negative numbers not allowed: -1\n").to_stdout
      end

      it 'includes the negative numbers in the exception message' do
        expect { StringCalculator.new.parse_input("-1,2,-3") }.to output("Negative numbers not allowed: -1, -3\n").to_stdout
      end
    end
  end

  describe '#digits' do
    it 'returns an array of integers from the input string' do
      expect(StringCalculator.new.digits("1,2,3")).to eq([1, 2, 3])
    end
  end

  describe '#determine_delimiter' do
    it 'returns a default delimiter if not specified' do
      expect(StringCalculator.new.determine_delimiter("1,2,3")).to eq(',')
    end

    it 'returns the specified delimiter' do
      expect(StringCalculator.new.determine_delimiter("//;\n1;2;3")).to eq(';')
    end
  end
end
