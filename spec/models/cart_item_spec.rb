require 'rails_helper'

RSpec.describe CartItem, type: :model do
  subject { create(:cart_item) }

  context 'validations' do
    it { should validate_presence_of(:cart) }
    it { should validate_presence_of(:product) }
  end

  context 'associations' do
    it { should belong_to(:cart) }
    it { should belong_to(:product) }


    describe '#undiscounted' do
      let(:promotion) { create(:promotion) }
      let!(:discounted_cart_item) { create(:cart_item, promotion: promotion) }
      let!(:undiscounted_cart_item) { create(:cart_item) }

      it 'will return all undiscounted items' do
        expect(CartItem.undiscounted.ids).to contain_exactly(undiscounted_cart_item.id)
      end
    end

    describe '#ordered_by_category' do
      let(:first_product) { create(:product, category: create(:category, name: "Alphabetically First")) }
      let(:second_product) { create(:product, category: create(:category, name: "B Alphabetically Second"))  }
      let!(:first_cart_item) { create(:cart_item, product: first_product) }
      let!(:second_cart_item) { create(:cart_item, product: second_product) }

      it 'will return all crt items ordered by their products category' do
        expect(CartItem.ordered_by_category.ids).to eq([ first_cart_item.id, second_cart_item.id ])
      end
    end

    describe '#human_units_of_sale' do
      let(:product) { create(:product, units_of_sale: 'gram') }
      let(:cart_item) { create(:cart_item, quantity: 2, product: product) }

      it 'will format a string for human readability' do
        expect(cart_item.human_units_of_sale).to eq('2 grams')
      end
    end

    describe '#add_promotion' do
      let(:promo) { create(:promotion) }
      let(:cart_item) { create(:cart_item) }
      it 'will update the cart item to point to the promotion' do
        expect { cart_item.add_promotion(promo) }.to change(cart_item, :promotion).from(nil).to(promo)
      end
    end
  end
end
