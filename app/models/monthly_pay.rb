# frozen_string_literal: true

class MonthlyPay
  attr_reader :salary, :super_rate
  def initialize(salary, super_rate, tax_calculator, super_calculator)
    NumericValidator.validate([salary, super_rate])

    @salary = salary
    @super_rate = super_rate
    @tax_calculator = tax_calculator
    @super_calculator = super_calculator
  end

  def tax
    @tax_calculator.calculate(salary)
  end

  def gross_income
    (salary.to_f / 12).round
  end

  def net_income
    gross_income - tax
  end

  def superannuation
    @super_calculator.calculate(salary, super_rate)
  end
end
