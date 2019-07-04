# encoding: utf-8

# Класс Фильм.
class Film < Product
  PRODUCT_NAME = "Фильм"

  attr_accessor :released

  def initialize(params)
    super

    @released = params[:released]
  end

  def self.from_file(path)
    lines = File.readlines(path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
      title: lines[0],
      autor: lines[1],
      released: lines[2].to_i,
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end

  def to_s
    "#{PRODUCT_NAME} «#{@title}», #{@released}, реж. #{@autor}, #{super}"
  end

  def update(params)
    super

    @amount = params[:released] if params[:released]
  end
end
