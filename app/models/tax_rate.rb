# frozen_string_literal: true

class TaxRate
  attr_reader :min, :max, :percentage, :base_tax_amount

  def initialize(min, max, percentage, base_tax_amount)
    validate_params(min, max, percentage, base_tax_amount)
    @min = min
    @max = max
    @percentage = percentage.to_f / 100
    @base_tax_amount = base_tax_amount
  end

  def to_s
    return 'Nil' if min.zero?

    base_tax_amount_str = base_tax_amount.zero? ? ' ' : " $#{base_tax_amount} plus"
    max_str = max.nil? ? 'and over' : "- $#{max}"
    "$#{min} #{max_str},#{base_tax_amount_str} #{percentage * 100}c for each $1 over $#{min - 1}"
  end

  private

  def validate_params(min, max, percentage, base_tax_amount)
    NumericValidator.validate([min, percentage, base_tax_amount])
    NumericValidator.validate([max]) unless max.nil?
    raise ArgumentError, 'max should greater than min.' if !max.nil? && max < min
  end
end
