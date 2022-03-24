class Client < ActiveRecord::Base
    #attr_accessor :firstname, :lastname
    has_many :orders
    has_many :products, through: :orders
    has_many :orderItems, through: :orders
    has_many :comments, :foreign_key => :author_id


end