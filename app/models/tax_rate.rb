# frozen_string_literal: true

class TaxRate
  def initialize(min, max, percentage, base_tax_amount)
    @min = min
    @max = max
    @percentage = percentage.to_f / 100
    @base_tax_amount = base_tax_amount
  end

  def calculate(taxable_income)
    if taxable_income < @min || (@max && taxable_income > @max)
      raise StandardError, 'income is not in this tax level'
    end
    (@base_tax_amount + (taxable_income - @min + 1) * @percentage).round
  end
end
