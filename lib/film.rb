# encoding: utf-8

# Класс Фильм.
class Film < Product
  PRODUCT_NAME = "Фильм"

  attr_accessor :released

  def initialize(params)
    super

    @released = params[:released]
  end


  def update(params)
    super

    @amount = params[:released] if params[:released]
  end

  def to_s
    "#{PRODUCT_NAME} «#{@title}», #{@released}, реж. #{@autor}, #{super}"
  end
end
