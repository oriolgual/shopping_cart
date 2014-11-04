require 'spec_helper'

module ShoppingCart
  describe Houseware do
    describe 'discount' do
      let(:shopping_day) { Date.new(2014, 11, 1) }

      context "when the price is bigger than 100" do
        it "has a 5% discount" do
          expect(Houseware.new('Vacuum cleaner', 150).discount(shopping_day)).to eq(7.5)
          expect(Houseware.new('Vacuum cleaner', 120).discount(shopping_day)).to eq(6)
        end
      end

      context "otherwise" do
        it "has no discount" do
          expect(Houseware.new('Vacuum cleaner', 80).discount(shopping_day)).to eq(0)
        end
      end
    end
  end
end
