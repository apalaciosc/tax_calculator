# frozen_string_literal: true

PRODUCTS_EXCLUDED_BASIC_SALES_TAX = [
  'book',
  'chocolate',
  'headache pill'
].freeze

class Product
  attr_reader :product_description

  def initialize(product_description)
    @product_description = product_description
  end

  def final_cost
    (total_without_taxes + total_taxes).round(2)
  end

  def total_without_taxes
    @total_without_taxes ||= quantity * price
  end

  def total_taxes
    basic_taxes + imported_taxes
  end

  def quantity
    splited_description.first&.to_i
  end

  def description
    splited_description[1..-3].join(' ')
  end

  def price
    splited_description.last&.to_f
  end

  private

  def imported_taxes
    return 0 unless description.include?('imported')

    (price * 0.05).round(1) * quantity
  end

  def basic_taxes
    return 0 if excluded_for_basic_tax?

    total_without_taxes * 0.1
  end

  def excluded_for_basic_tax?
    PRODUCTS_EXCLUDED_BASIC_SALES_TAX.any? do |excluded_product_description|
      description.include?(excluded_product_description)
    end
  end

  def splited_description
    @splited_description ||= product_description.split
  end
end
