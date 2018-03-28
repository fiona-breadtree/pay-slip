# frozen_string_literal: true

class TaxCalculator
  TAX_RATES = [
    [0, 18_200, 0, 0],
    [18_201, 37_000, 19, 0],
    [37_001, 87_000, 32.5, 3_572],
    [87_001, 180_000, 37, 19_822],
    [180_001, nil, 45, 54_232]
  ].freeze

  def initialize
    @tax_rates = {}
    TAX_RATES.each do |rate|
      @tax_rates[rate[0]] = TaxRate.new(*rate)
    end
  end

  def calculate(taxable_income)
    NumericValidator.validate([taxable_income])

    tax_rate = find_tax_rate(taxable_income)
    ((tax_rate.base_tax_amount + (taxable_income - tax_rate.min + 1) * tax_rate.percentage) / 12).round
  end

  private

  def find_tax_rate(taxable_income)
    @tax_rates.keys.each_with_index do |rate_min, index|
      return @tax_rates[@tax_rates.keys[index - 1]] if taxable_income < rate_min
    end
    @tax_rates[@tax_rates.keys[-1]]
  end
end
