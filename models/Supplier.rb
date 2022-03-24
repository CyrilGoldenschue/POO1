class Supplier < ActiveRecord::Base
    has_many :products
    has_many :categories, through: :products
    has_many :comments, as: :target

    validates :name, length: {minimum: 2, maximum: 60}


    
end
