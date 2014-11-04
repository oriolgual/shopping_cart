module ShoppingCart
  class Cart
    def initialize(products, customer, shopping_day = Date.today)
      @products = products || []
      @customer = customer
      @shopping_day = shopping_day
    end

    def add_product(product)
      @products.push(product)
    end

    def count
      @products.length
    end

    def total
    end
  end
end
