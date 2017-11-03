class Product
  # Each product has a name, base price, and tax rate.
  def initialize(name, base_price, tax_rate)
    @name = name
    @base_price = base_price
    @tax_rate = tax_rate
  end

  def price
    @base_price
  end

  def name
    @name
  end

  def taxes
    @tax_rate
  end

end
