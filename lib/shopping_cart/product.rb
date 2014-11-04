module ShoppingCart
  class Product
    attr_reader :name, :price

    def initialize(name, price)
      @name = name
      @price = price
    end

    # Public: It calculates the discount amount in Euros in a given date.
    #
    # shopping_day - The Date when the product is bought.
    #
    # Returns a Number.
    def discount(shopping_day)
      0
    end

    def discounted_price(shopping_day)
      price - discount(shopping_day)
    end
  end
end
