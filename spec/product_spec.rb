# frozen_string_literal: true

require_relative '../product'

describe Product do
  let(:product_with_all_taxes) { '1 imported bottle of perfume at 27.99' }
  let(:product_only_with_imported_taxes) { '1 imported box of chocolates at 10.00' }
  let(:product_without_taxes) { '2 book at 12.49' }

  describe '#final_cost' do
    context 'when is a product with all taxes' do
      subject { Product.new(product_with_all_taxes).final_cost }

      it { expect(subject).to eq(32.19) }
    end

    context 'when is a product only with imported taxes' do
      subject { Product.new(product_only_with_imported_taxes).final_cost }

      it { expect(subject).to eq(10.5) }
    end

    context 'when is a product without taxes' do
      subject { Product.new(product_without_taxes).final_cost }

      it { expect(subject).to eq(24.98) }
    end
  end

  describe '#total_without_taxes' do
    context 'when is a product with all taxes' do
      subject { Product.new(product_with_all_taxes).total_without_taxes }

      it { expect(subject).to eq(27.99) }
    end

    context 'when is a product only with imported taxes' do
      subject { Product.new(product_only_with_imported_taxes).total_without_taxes }

      it { expect(subject).to eq(10.00) }
    end

    context 'when is a product without taxes' do
      subject { Product.new(product_without_taxes).total_without_taxes }

      it { expect(subject).to eq(24.98) }
    end
  end

  describe '#total_taxes' do
    context 'when is a product with all taxes' do
      subject { Product.new(product_with_all_taxes).total_taxes }

      it { expect(subject).to eq(4.199) }
    end

    context 'when is a product only with imported taxes' do
      subject { Product.new(product_only_with_imported_taxes).total_taxes }

      it { expect(subject).to eq(0.5) }
    end

    context 'when is a product without taxes' do
      subject { Product.new(product_without_taxes).total_taxes }

      it { expect(subject).to eq(0) }
    end
  end

  describe '#quantity' do
    context 'when is a product with all taxes' do
      subject { Product.new(product_with_all_taxes).quantity }

      it { expect(subject).to eq(1) }
    end

    context 'when is a product only with imported taxes' do
      subject { Product.new(product_only_with_imported_taxes).quantity }

      it { expect(subject).to eq(1) }
    end

    context 'when is a product without taxes' do
      subject { Product.new(product_without_taxes).quantity }

      it { expect(subject).to eq(2) }
    end
  end

  describe '#description' do
    context 'when is a product with all taxes' do
      subject { Product.new(product_with_all_taxes).description }

      it { expect(subject).to eq('imported bottle of perfume') }
    end

    context 'when is a product only with imported taxes' do
      subject { Product.new(product_only_with_imported_taxes).description }

      it { expect(subject).to eq('imported box of chocolates') }
    end

    context 'when is a product without taxes' do
      subject { Product.new(product_without_taxes).description }

      it { expect(subject).to eq('book') }
    end
  end

  describe '#price' do
    context 'when is a product with all taxes' do
      subject { Product.new(product_with_all_taxes).price }

      it { expect(subject).to eq(27.99) }
    end

    context 'when is a product only with imported taxes' do
      subject { Product.new(product_only_with_imported_taxes).price }

      it { expect(subject).to eq(10.00) }
    end

    context 'when is a product without taxes' do
      subject { Product.new(product_without_taxes).price }

      it { expect(subject).to eq(12.49) }
    end
  end
end
