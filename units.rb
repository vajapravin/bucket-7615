module Units
  def quarter input, q
    q.call(input.to_i) || 0
  end

  def dime input, d
    d.call(input.to_i) || 0
  end

  def nickel input, n
    n.call(input.to_i) || 0
  end

  def penny input, p
    p.call(input.to_i) || 0
  end
end