module ShoppingCart
  class Fruit < Product
    def discount(shopping_day)
      if shopping_day.saturday? || shopping_day.sunday?
        price * 0.1
      else
        0
      end
    end
  end
end
