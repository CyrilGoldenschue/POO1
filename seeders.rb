require_relative 'connection'
require_relative 'models'

pcr = Category.create!(name: 'PCR', description: "woula")
sup = Category.create!(name: 'SUP', description: "woula")

supplier1 = Supplier.create!(name: "LaFerme")
supplier2 = Supplier.create!(name: "PromoViande")

product1 = Product.create!(name: 'apple', quantity: 50, price: 0.15, description: 'Little apple', category: pcr, supplier: supplier1)
product2 = Product.create!(name: 'lemon', quantity: 100, price: 0.20, description: 'Big lemon', category: pcr, supplier: supplier2)
product3 = Product.create!(name: 'limousine', quantity: 6, price: 25.95, description: 'A limousine', category: sup, supplier: supplier1)
product4 = Product.create!(name: 'truck', quantity: 8, price: 200, description: 'A truck', category: sup, supplier: supplier2)

individual = Individual.create!(firstname: 'Cyril', lastname: 'Goldenschue')
company = Company.create!(name: 'CPNV')

order1 = Order.new(status: 'PROGRESS')
order1.orderItems << [
  OrderItem.new(quantity: 2, product: product1),
  OrderItem.new(quantity: 1, product: product3),
  OrderItem.new(quantity: 1, product: product4)
]
individual.orders << order1
order1.save!
individual.save!

order2 = Order.new(status: 'PROGRESS')
order2.orderItems << [
  OrderItem.new(quantity: 5, product: product1),
  OrderItem.new(quantity: 75, product: product2),
  OrderItem.new(quantity: 3, product: product3),
  OrderItem.new(quantity: 2, product: product4)
]
company.orders << order2
order2.save!
company.save!

comment1 = supplier1.comments.create(body: "c'est un très bon fournisseur")
individual.comments << comment1

comment2 = product1.comments.create(body: "très bon produit")
company.comments << comment2

puts '--SEEDERS DONE--'