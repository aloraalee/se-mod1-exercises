class Bag

    def initialize
    @items = []
    end

    def empty?
        @items.empty?
    end
    
    def count
        @items.count
    end

    def candies 
        @items
    end

    def add_candy(candy)
        @items << candy
    end

    def contains?(type)
        @items.any? do |candy|
        candy.type == type
        end
    end
    
end