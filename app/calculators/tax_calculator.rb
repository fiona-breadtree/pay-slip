# frozen_string_literal: true

class TaxCalculator
  def calculate(taxable_income, year_for_tax_rates)
    NumericValidator.validate([taxable_income])

    tax_rate = find_tax_rate(taxable_income, year_for_tax_rates)
    ((tax_rate.base_tax_amount + (taxable_income - tax_rate.min + 1) * tax_rate.percentage) / 12).round
  end

  private

  def find_tax_rate(taxable_income, year_for_tax_rates)
    tax_rates = tax_rates_for_year(year_for_tax_rates)
    tax_rates.keys.each_with_index do |rate_min, index|
      return tax_rates[tax_rates.keys[index - 1]] if taxable_income < rate_min
    end
    tax_rates[tax_rates.keys[-1]]
  end

  def tax_rates_for_year(year_for_tax_rates)
    tax_rates = {}
    Object.const_get("TaxRates#{year_for_tax_rates}")::TAX_RATES.each do |rate|
      tax_rates[rate[0]] = TaxRate.new(*rate)
    end
    tax_rates
  end
end
