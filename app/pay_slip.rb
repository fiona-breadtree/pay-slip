# frozen_string_literal: true

class PaySlip
  def initialize(tax_calculator, super_calculator, employee, payment_start_date)
    @tax_calculator = tax_calculator
    @super_calculator = super_calculator
    @employee = employee
    @payment_period = MonthPeriod.new(payment_start_date)
  end

  def generate
    monthly_pay = MonthlyPay.new(@employee.annual_salary, @employee.super_rate,
                                 @tax_calculator, @super_calculator, @payment_period.year)

    {
      name: "#{@employee.first_name} #{@employee.last_name}",
      pay_period: @payment_period.to_s,
      gross_income: monthly_pay.gross_income,
      income_tax: monthly_pay.tax,
      net_income: monthly_pay.net_income,
      super: monthly_pay.superannuation
    }
  end
end
