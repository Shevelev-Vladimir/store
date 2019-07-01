# encoding: utf-8

# Класс Книга.
class Book < Product
  PRODUCT_NAME = "Книга"

  attr_accessor :genre

  def self.from_file(path)
    lines = File.readlines(path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
      title: lines[0],
      genre: lines[1],
      autor: lines[2],
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end

  def initialize(params)
    super

    @genre = params[:genre]
  end

  def to_s
    "#{PRODUCT_NAME} «#{@title}», #{@genre}, автор - #{@autor}, #{super}"
  end

  def update(params)
    super

    @amount = params[:genre] if params[:genre]
  end
end
