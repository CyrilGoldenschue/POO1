class Individual < Client

    validates :firstname, :lastname, length: {minimum: 2, maximum: 60}

    def to_s
        "#{firstname} #{lastname}"
    end


end