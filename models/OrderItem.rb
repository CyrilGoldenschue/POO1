class OrderItem < ActiveRecord::Base
    belongs_to :product
    belongs_to :order

    validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
    validates :product, :order, presence: true

    #callback
    before_save :set_item_price
    after_save :set_quantity

    scope :bulk, ->(quantity = 100) {where("quantity >= ?", quantity)}

    #def initialize(*)   #constructeur
    #    super           #appel du parent
        #self.item_price = product.price
    #end
    #def to_s
    #    "#{product.name}  #{quantity}"
    #end
    
    def price
        quantity * item_price
    end

    private
    def set_item_price
        self.item_price ||= product.price
    end

    private
    def set_quantity
        product.quantity = product.quantity - quantity
        product.save
    end


end