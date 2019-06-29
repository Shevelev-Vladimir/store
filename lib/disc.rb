# encoding: utf-8

# Класс Диск.
class Disс < Product
  PRODUCT_NAME = "Альбом"

  def to_s
    "#{PRODUCT_NAME} #{autor} - «#{name}», #{genre}, #{released}, \
      #{price} руб. (осталось #{amount})"
  end
end
