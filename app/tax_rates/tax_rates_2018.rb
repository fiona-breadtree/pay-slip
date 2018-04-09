# frozen_string_literal: true

class TaxRates2018
  TAX_RATES = [
    [0, 18_200, 0, 0],
    [18_201, 37_000, 19, 0],
    [37_001, 87_000, 32.5, 3_572],
    [87_001, 180_000, 37, 19_822],
    [180_001, nil, 45, 54_232]
  ].freeze
end
