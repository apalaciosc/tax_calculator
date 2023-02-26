# frozen_string_literal: true

require_relative 'product'

class TaxCalculator
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def run!
    products.each do |product|
      puts "#{product.quantity} #{product.description}: #{format_decimal(product.final_cost)}"
    end

    puts "Sales Taxes: #{sales_taxes}"
    puts "Total: #{total}"
  end

  private

  def format_decimal(number)
    '%.2f' % number
  end

  def total
    format_decimal(products.sum(&:final_cost))
  end

  def sales_taxes
    format_decimal(products.sum(&:total_taxes))
  end

  def products
    @products ||= input.split("\n").map do |product_description|
      Product.new(product_description)
    end
  end
end
