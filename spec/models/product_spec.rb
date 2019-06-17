require 'rails_helper'

RSpec.describe Product, type: :model do
  require 'rails_helper'

RSpec.describe Product, type: :model do
    let(:name) {'Laptop'}
    let(:price_cents) {600}
    let(:quantity) {10}
    let(:category) {Category.create(name: 'Electronics')}
    let(:product) {Product.new(name: name, price_cents: price_cents, quantity: quantity, category: category)}

  context 'when all the proper attributes are provided' do
    it 'is valid' do
      product.valid?
      expect(product).to be_valid
    end
  end

  context 'when name is not provided' do
    it 'should not be valid' do
      product.name = nil
      expect(product).to_not be_valid
    end

    it 'reports a validation error on the name' do
      product.name = nil
      product.valid?
      expect(product.errors.full_messages).to include ("Name can't be blank")
    end
  end


  context 'when price is not provided' do
    it 'should not be valid' do
      product.price_cents = nil
      expect(product).to_not be_valid
    end

    it 'reports a validation error on the price' do
      product.price_cents = nil
      product.valid?
      expect(product.errors.full_messages).to include ("Price can't be blank")
    end
  end

  context 'when quantity is not provided' do
    it 'should not be valid' do
      product.quantity = nil
      expect(product).to_not be_valid
    end

    it 'reports a validation error on the price' do
      product.quantity = nil
      product.valid?
      expect(product.errors.full_messages).to include ("Quantity can't be blank")
    end
  end

  context 'when category is not provided' do
    it 'should not be valid' do
      product.category= nil
      expect(product).to_not be_valid
    end

    it 'reports a validation error on the price' do
      product.category = nil
      product.valid?
      expect(product.errors.full_messages).to include ("Category can't be blank")
    end
  end
end

