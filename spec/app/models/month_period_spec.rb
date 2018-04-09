# frozen_string_literal: true

require 'spec_helper'

describe 'Monthly period' do
  context 'when initializing with non-Feb month' do
    let(:month) { MonthPeriod.new('01-10-2017') }

    it 'returns 31 days in the month' do
      expect(month.to_s).to eq '01 October - 31 October, 2017'
    end
  end

  context 'when initializing with Feb in non leap year' do
    let(:month) { MonthPeriod.new('01-02-2018') }

    it 'returns 28 days in the month' do
      expect(month.to_s).to eq '01 February - 28 February, 2018'
    end
  end

  context 'when initializing with Feb in leap year' do
    let(:month) { MonthPeriod.new('01-02-2000') }

    it 'returns 29 days in the month' do
      expect(month.to_s).to eq '01 February - 29 February, 2000'
    end
  end
end
