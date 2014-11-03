require "shopping_cart/version"

module ShoppingCart
  class Cart
    def initialize(items, shopping_day = Date.today, extra_loyal_customer = false)
      @items = items
      @shopping_day = shopping_day
      @extra_loyal_customer = extra_loyal_customer
    end

    def total
    end

  end

  class Item
    attr_reader :name, :price

    def initialize(name, price)
      @name = name
      @price = price
    end

    def discount(shopping_day)
    end
  end
end
