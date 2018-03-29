# frozen_string_literal: true

require 'csv'

class CsvProcessor
  OUTPUT_HEADERS = ['Name', 'Pay Period', 'Gross Income', 'Income Tax', 'Net Income', 'Super'].freeze

  def self.parse(csv_file)
    employee_list = []
    # INPUT_HEADERS = [:first_name, :last_name, :annual_salary, :super_rate, :payment_start_date ]
    CSV.foreach(csv_file, headers: true) do |row|
      employee = Employee.new(row[0], row[1], row[2].to_f, row[3][0..-2].to_f / 100)
      employee_list << [employee, row[4]]
    end
    employee_list
  end

  def self.export(csv_file, generated_pay_slips)
    CSV.open(csv_file, 'w', write_headers: true, headers: OUTPUT_HEADERS) do |lines|
      generated_pay_slips.each do |pay_slip|
        lines << [pay_slip[:name],
                  pay_slip[:pay_period],
                  pay_slip[:gross_income],
                  pay_slip[:income_tax],
                  pay_slip[:net_income],
                  pay_slip[:super]]
      end
    end
  end
end
