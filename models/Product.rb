class Product < ActiveRecord::Base

    belongs_to :category
    belongs_to :supplier
    has_many :orderItems
    has_many :orders, through: :orderItems
    has_many :comments, as: :target

    scope :cheap, -> { where("price <= ?", 0.20 )}

    validates :category,  :name, :supplier, presence: true
    validates :price, presence: true, numericality: {greater_than: 0}

    def to_s
        "#{name} #{price} CHF"
    end

end