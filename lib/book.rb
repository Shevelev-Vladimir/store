# encoding: utf-8

# Класс Книга.
class Book < Product
  PRODUCT_NAME = "Книга"

  def to_s
    "#{PRODUCT_NAME} «#{name}», #{genre}, автор - #{autor}, \
      #{price} руб. (осталось #{amount})"
  end
end
