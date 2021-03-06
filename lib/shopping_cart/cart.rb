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
      total_amount - loyalty_discount
    end

    private

    def total_amount
      @total_amount ||= @products.inject(0) do |total, product|
        total += product.discounted_price(@shopping_day)
      end
    end

    def loyalty_discount
      return 0 if !@customer.loyal? || count < 5

      total_amount * 0.1
    end
  end
end
