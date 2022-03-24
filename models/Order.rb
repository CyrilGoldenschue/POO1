class Order < ActiveRecord::Base
    #attr_accessor :created_at, :shipped_at, :status
    belongs_to :client
    has_many :products, through: :orderItems
    has_many :orderItems

    validates :orderItems, :client, presence: true
    validates_associated :orderItems

    def to_s
        puts "le prix total est de : #{price}"
    end

    def price
        orderItems.sum {|orderItem| orderItem.price}       
    end
end