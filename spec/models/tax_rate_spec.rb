# frozen_string_literal: true

require 'spec_helper'

describe 'Tax Rate' do
  context 'when creating a tax rate with percentage is 0' do
    let(:tax_rate_1) { TaxRate.new(0, 18_200, 0, 0) }

    it 'returns 0 when tax income in the range' do
      expect(tax_rate_1.calculate(13_000)).to eq 0
    end

    it 'raise error when tax income out of the range' do
      expect { tax_rate_1.calculate(18_202) }.to raise_error(StandardError)
    end
  end

  context 'when creating a tax rate with percentage is not 0' do
    let(:tax_rate_2) { TaxRate.new(18_201, 37_000, 19, 0) }

    it 'returns correct value when tax income in the range' do
      expect(tax_rate_2.calculate(35_000)).to eq 3192
    end

    it 'raise error when tax income out of the range' do
      expect { tax_rate_2.calculate(18_200) }.to raise_error(StandardError)
    end
  end

  context 'when creating a tax rate with max is nil' do
    let(:tax_rate_1) { TaxRate.new(180_001, nil, 45, 54_232) }

    it 'returns correct value when tax income in the range' do
      expect(tax_rate_1.calculate(200_000)).to eq 63232
    end
  end
end
