# frozen_string_literal: true

require 'spec_helper'

describe 'Pay Slip' do
  context 'when generating pay slip' do
    let(:pay_slip) { PaySlip.new(tax_calculator, super_calculator, employee, payment_start_date) }
    let(:tax_calculator)     { TaxCalculator.new }
    let(:super_calculator)   { SuperCalculator.new }
    let(:payment_start_date) { '01-03-2018' }

    context 'when salary for employee in rate 1 without tax' do
      let(:employee) { Employee.new('FirstN', 'LastN', 17_000, 0.095) }

      it 'returns tax as 0' do
        expect(pay_slip.generate[:income_tax]).to eq 0
      end
    end

    context 'when salary for employee in rate with tax' do
      let(:employee) { Employee.new('FirstN', 'LastN', 60_050, 0.09) }

      it 'returns tax' do
        expect(pay_slip.generate[:income_tax]).to eq 922
        expect(pay_slip.generate[:super]).to eq 450
      end
    end

    context 'when salary for employee in rate with tax and different super' do
      let(:employee) { Employee.new('FirstN', 'LastN', 120_000, 0.1) }

      it 'returns tax' do
        expect(pay_slip.generate[:net_income]).to eq 7331
        expect(pay_slip.generate[:super]).to eq 1000
      end
    end
  end
end
