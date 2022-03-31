require_relative 'connection'
require_relative 'models'
require_relative 'observers'

ActiveRecord::Base.observers << ProductObserver
ActiveRecord::Base.instantiate_observers

supplier = Supplier.find(2)
product = Product.find(4)
client = Client.find_by lastname: "Goldenschue"
#puts "#{client.firstname}  #{client.lastname}"

#client.products.cheap.each do |product|
#    puts "  #{product.name} trouvé dans #{product.orders.count} commandes"
#end

#supplier.categories.each do |category|
#    puts category
#end

#EX9
#order1 = Order.new(status: 'PROGRESS')
#order1.orderItems << [
#  OrderItem.new(quantity: 2, product: product),
#]
#client.orders << order1
#order1.save!
#client.save!

#Ex2_suite
#1

starts_at = Time.now - 1.week
ends_at = starts_at + 1.week
puts "\nCommandes passée entre #{starts_at} et #{ends_at}"
puts Order.between(starts_at, ends_at)

#puts Client.all().without_orders
#Client.all().without_orders.destroy_all
#puts "Doit être vide: #{Client.all().without_orders.all.join}"

#client.comments.each do |comment|
#    puts comment.product.name
#end

#client.orders.each do |order| 
#    puts order
#end

#puts OrderItem.bulk(50).map {|oi| oi.product}



#order1 = Order.new(client: client)
#puts order1.save

#order2 = order1.orderItems.build
#puts order2.save

#order3 = order1.orderItems.build(quantity: 10)
#puts order3.save



