# frozen_string_literal: true

require_relative '../lib/boot'

class PaySlipsProcessor
  def initialize(tax_calculator, super_calculator, paylist_file)
    @tax_calculator = tax_calculator
    @super_calculator = super_calculator
    @employee_list = CsvProcessor.parse(paylist_file)
  end

  def export(csv_file)
    CsvProcessor.export(csv_file, pay_slips)
  end

  private

  def pay_slips
    generated_pay_slips = []
    @employee_list.each do |employee_info|
      generated_pay_slips << PaySlip.new(@tax_calculator, @super_calculator, employee_info[0], employee_info[1]).generate
    end
    generated_pay_slips
  end
end

if $PROGRAM_NAME == __FILE__
  tax_calculator = TaxCalculator.new
  super_calculator = SuperCalculator.new

  pay_slips_input = ARGV[0]
  pay_slips_output = ARGV[1]

  if pay_slips_input.nil? || pay_slips_output.nil?
    puts 'Please give a correct pay slips input file or output file.'
    exit(0)
  end

  puts 'Start to process payslips...'

  processor = PaySlipsProcessor.new(tax_calculator, super_calculator, pay_slips_input)
  processor.export(pay_slips_output)

  puts 'Done.'
end
