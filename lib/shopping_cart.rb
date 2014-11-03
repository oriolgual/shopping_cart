require "shopping_cart/version"

module ShoppingCart
  class Cart
    def initialize(items, shopping_day = Date.today, extra_loyal_customer = false)
      @items = items
      @shopping_day = shopping_day
      @extra_loyal_customer = extra_loyal_customer
    end

    def total
      items_total - loyalty_discount
    end

    private
    def loyalty_discount
      return 0 unless @extra_loyal_customer

      items_total * 0.1
    end

    def items_total
      @items_total ||= @items.inject(0) do |total, item|
        total += (item.price - item.discount(@shopping_day))
      end
    end
  end

  class Item
    attr_reader :name, :price

    def initialize(name, price)
      @name = name
      @price = price
    end

    def discount(shopping_day)
      if [6,0].include?(shopping_day.wday) && @name == 'Banana'
        return @price * 0.1
      elsif @name == 'Vacuum cleaner' && @price > 100
        return @price * 0.05
      end

      0
    end
  end
end
