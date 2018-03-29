# frozen_string_literal: true

class Employee
  attr_reader :first_name, :last_name
  attr_accessor :annual_salary, :super_rate

  def initialize(first_name, last_name, annual_salary, super_rate)
    NumericValidator.validate([annual_salary, super_rate])

    @first_name = first_name
    @last_name = last_name
    @annual_salary = annual_salary
    @super_rate = super_rate
  end
end
