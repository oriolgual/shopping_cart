module ShoppingCart
  class Houseware < Product
    def discount(shopping_day)
      if price > 100
        price * 0.05
      else
        0
      end
    end
  end
end
