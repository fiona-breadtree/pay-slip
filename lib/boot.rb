# frozen_string_literal: true

require 'rubygems'
require 'bundler'

ENV['RACK_ENV'] ||= ENV.fetch('RACK_ENV', 'development')

Bundler.require(:default, ENV['RACK_ENV'].to_sym)

$LOAD_PATH.unshift File.expand_path('.', File.dirname(__FILE__))
$LOAD_PATH.unshift File.expand_path('../app', File.dirname(__FILE__))

require 'validators/numeric_validator'
require 'models/tax_rate'
require 'models/monthly_pay'
require 'models/month_period'
require 'models/employee'
require 'pay_slip'
require 'calculators/tax_calculator'
require 'calculators/super_calculator'
require 'csv_processor'
