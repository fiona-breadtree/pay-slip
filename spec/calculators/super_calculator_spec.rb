# frozen_string_literal: true

require 'spec_helper'

describe 'Super Calculator' do
  context 'when using super calculator' do
    let(:calculator) { SuperCalculator.new }

    it 'returns 0 when in super rate is 0' do
      expect(calculator.calculate(13_000, 0)).to eq 0
    end

    it 'returns correct value when super rate is not 0' do
      expect(calculator.calculate(35_000, 0.09)).to eq 263
    end
  end
end
