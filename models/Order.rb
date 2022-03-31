class Order < ActiveRecord::Base
    #attr_accessor :created_at, :shipped_at, :status
    belongs_to :client
    has_many :products, through: :orderItems
    has_many :orderItems

    validates :orderItems, :client, presence: true
    validates_associated :orderItems

    #scope :expensive, -> { reorder(id: :desc).limit(1)}
    scope :between, ->(starts_at, ends_at) {where(created_at: starts_at..ends_at)}

    def self.most_expensive
        all.max_by(&:price)
    end


    def to_s
        puts "le prix total est de : #{price}"
    end

    def price
        orderItems.sum {|orderItem| orderItem.price}       
    end
end