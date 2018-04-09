# frozen_string_literal: true

require 'date'

class MonthPeriod
  attr_reader :year
  def initialize(start_date_str)
    month_start_date = Date.parse(start_date_str)
    @month = month_start_date.mon
    @year = month_start_date.year
  end

  def to_s
    "01 #{name_of_month} - #{days_in_month} #{name_of_month}"
  end

  private

  def name_of_month
    Date.parse("01-#{@month}-#{@year}").strftime('%B')
  end

  def days_in_month
    Date.new(@year, @month, -1).day
  end
end
