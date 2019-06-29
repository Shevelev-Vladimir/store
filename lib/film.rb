# encoding: utf-8

# Класс Фильм.
class Film < Product
  PRODUCT_NAME = "Фильм"

  def to_s
    "#{PRODUCT_NAME} «#{@name}», #{@released}, \
      реж. #{@autor}, #{@price} руб. (осталось #{@amount})"
  end
end
