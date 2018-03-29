# frozen_string_literal: true

require 'spec_helper'

describe 'Pay Slips Processor' do
  context 'when generating pay slips' do
    let(:pay_slips_processor) { PaySlipsProcessor.new(tax_calculator, super_calculator, pay_slips_file) }
    let(:tax_calculator)      { TaxCalculator.new }
    let(:super_calculator)    { SuperCalculator.new }
    let(:pay_slips_file)      { './spec/support/fixtures/input.csv' }
    let(:exported_pay_slip)   { 'exported_pay_slip.csv' }

    it 'exports correct payslip' do
      expect(pay_slips_processor.export(exported_pay_slip).size).to eq 2
    end
  end
end
