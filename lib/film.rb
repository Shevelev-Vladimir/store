# encoding: utf-8

# Класс Фильм.
class Film < Product
  PRODUCT_NAME = "Фильм"

  def initialize(params)
    super
  end

  def to_s
    "#{PRODUCT_NAME} «#{@title}», #{@released}, реж. #{@autor}, #{super}"
  end
end
