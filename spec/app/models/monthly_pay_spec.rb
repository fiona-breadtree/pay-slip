# frozen_string_literal: true

require 'spec_helper'

describe 'Monthly pay' do
  let(:monthly_pay)      { MonthlyPay.new(salary, super_rate, tax_calculator, super_calculator, payment_year) }
  let(:salary)           { 55_000 }
  let(:super_rate)       { 0.095 }
  let(:tax_calculator)   { double('TaxCalculator') }
  let(:super_calculator) { double('SuperCalculator') }
  let(:payment_year)     { 2018 }

  context 'when calculating pay' do
    it 'returns correct gross income' do
      allow(tax_calculator).to receive(:calculate).and_return(400)
      allow(super_calculator).to receive(:calculate).and_return(395)
      expect(monthly_pay.gross_income).to eq 4583
      expect(monthly_pay.tax).to eq 400
      expect(monthly_pay.net_income).to eq 4183
      expect(monthly_pay.superannuation).to eq 395
    end
  end
end
