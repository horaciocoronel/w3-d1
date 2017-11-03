require './product.rb'

class ShoppingCart

  def initialize
    @contents = []
  end

  def add_to_cart(product)
    @contents << product
  end

  def remove_from_cart(product)
    @contents.delete(product)
  end

  def total_before_taxes
    total = 0
    @contents.each do |product|
      total +=  product.price
    end
    puts "$#{total}"
  end

  def total
    total = 0
    @contents.each do |product|
      total +=  product.price * product.taxes
    end
    puts "$#{total}"
  end

  def show_content
    @contents.each do |product|
      puts "#{product.name}: #{product.price}."
    end
  end
end

shopping_trip = ShoppingCart.new

phone = Product.new("Phone", 600.00, 0.13)
tablet = Product.new("Tablet", 400.99, 0.13)
laptop = Product.new("Macbook", 1209.99, 0.13)

puts "*** Add items to Cart ***"
shopping_trip.add_to_cart tablet
shopping_trip.show_content
puts "*** Add items to Cart ***"
shopping_trip.add_to_cart phone
shopping_trip.show_content
puts "*** Add items to Cart ***"
shopping_trip.add_to_cart laptop
shopping_trip.show_content
puts "*** Remove item to Cart ***"
shopping_trip.remove_from_cart tablet
shopping_trip.show_content
puts "*** Total with Taxes ***"
shopping_trip.total
