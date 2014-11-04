require 'spec_helper'

module ShoppingCart
  describe Fruit do
    describe 'discount' do
      context "on weekdays" do
        let(:day) do
          Date.new(2014, 11, 3)
        end

        it "has no discount" do
          expect(Fruit.new('Banana', 10).discount(day)).to eq(0)
        end
      end

      context "on weekends" do
        it "has a 10% discount" do
          day = Date.new(2014, 11, 2)
          expect(Fruit.new('Banana', 10).discount(day)).to eq(1)

          day = Date.new(2014, 11, 1)
          expect(Fruit.new('Avocado', 20).discount(day)).to eq(2)
        end
      end
    end
  end
end
