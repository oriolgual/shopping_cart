module ShoppingCart
  class Product
    attr_reader :name, :price

    def initialize(name, price)
      @name = name
      @price = price
    end

    def discount(shopping_day)
      0
    end
  end
end
