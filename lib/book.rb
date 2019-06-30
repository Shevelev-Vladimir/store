# encoding: utf-8

# Класс Книга.
class Book < Product
  PRODUCT_NAME = "Книга"

  attr_accessor :genre

  def initialize(params)
    super

    @genre = params[:genre]
  end

  def update(params)
    super

    @amount = params[:genre] if params[:genre]
  end

  def to_s
    "#{PRODUCT_NAME} «#{@title}», #{@genre}, автор - #{@autor}, #{super}"
  end
end
