require 'spec_helper'

module ShoppingCart
  describe Cart do
    let(:products) do
      [
        Fruit.new('Banana', 10),
        Product.new('Orange juice', 10),
        Product.new('Rice', 1),
        Houseware.new('Vacuum cleaner', 150),
        Product.new('Anchovies', 2),
      ]
    end

    let(:shopping_day) do
      Date.today
    end

    let(:customer) do
      Customer.new(false)
    end

    let(:cart) do
      ShoppingCart::Cart.new(products, customer, shopping_day)
    end

    describe 'total' do
      it 'sums the prices of the products in the cart' do
        expect(cart.total).to eq(165.50)
      end

      context "when it is a extra loyal customer" do
        let(:customer) do
          Customer.new(true)
        end

        context "when it has bought more than 5 products" do
          let(:products) do
            [
              Fruit.new('Banana', 10),
              Product.new('Orange juice', 10),
              Product.new('Rice', 1),
              Product.new('Rice', 1),
              Houseware.new('Vacuum cleaner', 150),
              Product.new('Anchovies', 2),
            ]
          end

          it 'has an extra 10% discount' do
            expect(cart.total).to eq(149.85)
          end
        end
      end
    end
  end
end
