# frozen_string_literal: true

require 'spec_helper'

describe 'Numeric Validator' do
  context 'when using non-negative validator' do
    it 'raise error when parameter is negative' do
      expect { NumericValidator.validate([-3.4]) }.to raise_error(ArgumentError)
    end
  end

  context 'when using negative validator' do
    it 'raise error when parameter is not negative' do
      expect { NumericValidator.validate([3.4], false) }.to raise_error(ArgumentError)
    end
  end
end
