# encoding: utf-8

# Класс Диск.
class Disс < Product
  PRODUCT_NAME = "Альбом"

  def to_s
    "#{PRODUCT_NAME} #{autor} - «#{title}», #{genre}, #{released}, #{super}"
  end
end
