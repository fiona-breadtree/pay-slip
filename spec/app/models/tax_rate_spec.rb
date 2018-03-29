# frozen_string_literal: true

require 'spec_helper'

describe 'Tax Rate' do
  context 'when intializing a tax rate with correct information' do
    context 'when min is 0' do
      let(:tax_rate) { TaxRate.new(0, 18_200, 0, 0) }

      it 'prints Nil' do
        expect(tax_rate.to_s).to eq 'Nil'
      end
    end
    context 'when max is nil' do
      let(:tax_rate) { TaxRate.new(180_001, nil, 45, 54_232) }

      it 'prints correct' do
        expect(tax_rate.to_s).to eq '$180001 and over, $54232 plus 45.0c for each $1 over $180000'
      end
    end
  end

  context 'when intializing a tax rate with wrong min' do
    it 'throws error' do
      expect { TaxRate.new(-1, 18_200, 0, 0) }.to raise_error(ArgumentError)
    end
  end
end
