module CurrencyValidations
  def not_number arg
    arg != arg.to_i.to_s
  end
end