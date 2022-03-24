require 'rails/observers/activerecord/active_record'
class ProductObserver < ActiveRecord::Observer
    observe :product

    def after_update(product)
        puts "Attention le #{product.name} a une quantité actuelle de #{product.quantity} il faut rapidement recharger le stock !!!"
    end
end