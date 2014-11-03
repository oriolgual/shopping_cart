require 'spec_helper'

module ShoppingCart
  describe Cart do
    let(:items) do
      [
        Item.new('Banana', 10),
        Item.new('Orange juice', 10),
        Item.new('Rice', 1),
        Item.new('Vacuum cleaner', 150),
        Item.new('Anchovies', 2),
      ]
    end

    let(:shopping_day) do
      Date.today
    end

    let(:extra_loyal_customer) do
      false
    end

    let(:cart) do
      ShoppingCart::Cart.new(items, shopping_day, extra_loyal_customer)
    end

    describe 'total' do
      it 'sums the prices of the items in the cart' do
        expect(cart.total).to eq(165.5)
      end

      context "when it is a extra loyal customer" do
        let(:extra_loyal_customer) do
          true
        end

        context "when it has bought more than 5 items" do
          let(:items) do
            [
              Item.new('Banana', 10),
              Item.new('Orange juice', 10),
              Item.new('Rice', 1),
              Item.new('Rice', 1),
              Item.new('Vacuum cleaner', 150),
              Item.new('Anchovies', 2),
            ]
          end

          it 'has an extra 10% discount' do
            expect(cart.total).to eq(149.85)
          end
        end
      end
    end
  end

  describe Item do
    context "when it's a fruit" do
      context "on weekdays" do
        let(:day) do
          Date.new(2014, 11, 3)
        end

        it "has no discount" do
          expect(Item.new('Banana', 10).discount(day)).to eq(0)
        end
      end

      context "on weekends" do
        it "has a 10% discount" do
          day = Date.new(2014, 11, 2)
          expect(Item.new('Banana', 10).discount(day)).to eq(1)

          day = Date.new(2014, 11, 1)
          expect(Item.new('Banana', 10).discount(day)).to eq(1)
        end
      end

      context "when it's not a fruit" do
        context "on weekends" do
          it "has no discount" do
            expect(Item.new('Rice', 1).discount(Date.new(2014, 11, 1))).to eq(0)
          end
        end
      end
    end

    context "when it's houseware" do
      let(:shopping_day) { Date.new(2014, 11, 1) }

      context "when the prices is bigger than 100" do
        it "has a 5% discount" do
          expect(Item.new('Vacuum cleaner', 150).discount(shopping_day)).to eq(7.5)
        end
      end

      context "otherwise" do
        it "has no discount" do
          expect(Item.new('Vacuum cleaner', 80).discount(shopping_day)).to eq(0)
        end
      end
    end
  end
end
