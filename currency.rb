require "#{File.dirname(__FILE__)}/units.rb"
require "#{File.dirname(__FILE__)}/currency_exception.rb"
require "#{File.dirname(__FILE__)}/currency_validations.rb"

class Currency
  include Units
  include CurrencyException
  include CurrencyValidations

  def change_for(input)
    must_number && return if not_number(input)
    q = Proc.new{|i| i / 25 if i >= 25}
    d = Proc.new{|i| (i%25) / 10 if (i%25) >= 10}
    n = Proc.new{|i| ((i%25) % 10) / 5 if ((i%25) % 10) >= 5}
    p = Proc.new{|i| ((i%25) % 10) % 5 if ((i%25) % 10) % 5 >= 1}
    op = { quarter: quarter(input, q), dime: dime(input, d), nickel: nickel(input, n), penny: penny(input, p) }
    puts op
  end
end

Currency.new.change_for(ARGV[0])