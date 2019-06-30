# encoding: utf-8

# Класс Книга.
class Book < Product
  PRODUCT_NAME = "Книга"

  def to_s
    "#{PRODUCT_NAME} «#{@title}», #{@genre}, автор - #{@autor}, #{super}"
  end
end
