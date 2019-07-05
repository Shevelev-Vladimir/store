# encoding: utf-8

# Класс Корзина покупателя.
class Basket
  # Добавляем продукт в корзину.
  def add_to_purchase(product)
    @products << product
  end

  # Считает общую цену.
  def price_all
    @products.sum(&:price)
  end

  def initialize
    @products = []
  end

  def to_s
    @products.join("\n")
  end
end
