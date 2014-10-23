class Product
	attr_accessor :price, :tax, :name

	def initialize(price, tax)
		@price = price
		@tax = tax
		@name = name
	end

	def price_with_tax
		(@price + (@price * @tax/100))
	end

	def sales_tax
		(@price * @tax / 100)
	end
end

#Input Products
book = Product.new(12.49,0)
cd = Product.new(14.99, 10)
chocolateBar = Product.new(0.85,0)

list = [book, cd, chocolateBar]

total = 0
sales_total = 0
list.each do |item|
	total += item.price_with_tax
	sales_total += item.sales_tax
end

puts "Sales Taxes: $" + '%.2f' % ((sales_total * 20).ceil.to_f / 20).to_s
puts "Total: $" + (total.round(2)).to_s
