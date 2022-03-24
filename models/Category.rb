class Category < ActiveRecord::Base
    #attr_accessor :name, :description
    has_many :products

    def to_s
        "#{name} #{description}"
    end
end