# frozen_string_literal: true

class SuperCalculator
  def calculate(taxable_income, super_rate)
    NumericValidator.validate([taxable_income, super_rate])

    ((taxable_income.to_f / 12).round * super_rate).round
  end
end
