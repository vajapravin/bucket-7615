require 'pry'
require "#{File.dirname(__FILE__)}/units.rb"
require "#{File.dirname(__FILE__)}/currency_exception.rb"
require "#{File.dirname(__FILE__)}/currency_validations.rb"

class Currency
  include Units
  include CurrencyException
  include CurrencyValidations

  def convert(input)
    if input >= 25
      return convert(input%25) + [{quarter: (input/25).to_i}]
    elsif input >= 10
      return convert(input%10) + [{dime: (input/10).to_i}]
    elsif input >= 5
      return convert(input%5) + [{nickel: (input/5).to_i}]
    else
      return [{penny: input}]
    end
  end

  def change_for(input)
    must_number && return if not_number(input)
    p convert(input.to_i)
  end
end

Currency.new.change_for(ARGV[0])