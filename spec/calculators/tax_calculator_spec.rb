# frozen_string_literal: true

require 'spec_helper'

describe 'Tax Calculator' do
  context 'when using tax calculator' do
    let(:calculator) { TaxCalculator.new }

    it 'returns 0 when in rate 1' do
      expect(calculator.calculate(13_000)).to eq 0
    end

    it 'returns correct value in rate 2' do
      expect(calculator.calculate(35_000)).to eq 266
    end

    it 'returns correct value for highest rate' do
      expect(calculator.calculate(200_000)).to eq 5269
    end
  end
end
