# frozen_string_literal: true

class NumericValidator
  def self.validate(params, non_negative = true)
    params.each do |param|
      if non_negative
        raise ArgumentError, "#{param} should be non_negative." unless (param.is_a? Numeric) && param >= 0
      else
        raise ArgumentError, "#{param} should be non_negative." unless (param.is_a? Numeric) && param < 0
      end
    end
  end
end
