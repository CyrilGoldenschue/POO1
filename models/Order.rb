class Order < ActiveRecord::Base
    #attr_accessor :created_at, :shipped_at, :status
    belongs_to :client
    has_many :products, through: :orderItems
    has_many :orderItems

    validates :orderItems, :client, presence: true
    validates_associated :orderItems

    #scope :expensive, -> { reorder(id: :desc).limit(1)}

    def self.most_expensive
        all.max_by(&:price)
    end


    def to_s
        puts "le prix total est de : #{price}"
    end

    def price
        orderItems.sum {|orderItem| orderItem.price}       
    end

    def self.test (startDate, endDate)
        all.where("created_at >= ?", startDate).where("created_at <= ?", endDate)
    end
end