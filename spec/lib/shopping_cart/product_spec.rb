require 'spec_helper'

module ShoppingCart
  describe Product do
    describe 'discount' do
      it "has no discount" do
        discount = Product.new('Rice', 1).discount(Date.new(2014, 11, 1))
        expect(discount).to eq(0)
      end
    end
  end
end
