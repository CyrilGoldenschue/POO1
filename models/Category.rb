class Category < ActiveRecord::Base
    #attr_accessor :name, :description
    has_many :products
    has_many :suppliers, through: :products

    has_many :orderItems, through: :products
    has_many :orders, through: :products

    def to_s
        "#{name} #{description}"
    end

    def self.never_ordered
        where.not(id: joins(:orders).pluck(:id))
    end
end