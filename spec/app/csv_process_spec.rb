# frozen_string_literal: true

require 'spec_helper'

describe 'Csv Processor' do
  context 'when parsing csv file' do
    it 'generates employee list with 2 records' do
      expect(CsvProcessor.parse('./spec/support/fixtures/input.csv').size).to eq 2
    end
  end

  context 'when exporting to csv file' do
    let(:pay_slips) { [pay_slip_1, pay_slip_2] }
    let(:pay_slip_1) do
      {
        name: 'Test Name',
        pay_period: '01 October - 31 October',
        gross_income: 5004,
        income_tax: 922,
        net_income: 4082,
        super: 450
      }
    end
    let(:pay_slip_2) do
      {
        name: 'Test Name2',
        pay_period: '01 October - 31 October',
        gross_income: 10_000,
        income_tax: 2669,
        net_income: 7331,
        super: 1000
      }
    end

    it 'exports to correct file' do
      expect(CsvProcessor.export('test.csv', pay_slips).size).to eq 2
    end
  end
end
