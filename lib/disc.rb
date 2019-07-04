# encoding: utf-8

# Класс Диск.
class Disc < Product
  PRODUCT_NAME = "Альбом"

  attr_accessor :genre, :released

  def initialize(params)
    super

    @genre = params[:genre]
    @released = params[:released]
  end

  def self.from_file(path)
    lines = File.readlines(path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
      title: lines[0],
      autor: lines[1],
      genre: lines[2],
      released: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end

  def to_s
    "#{PRODUCT_NAME} #{autor} - «#{title}», #{genre}, #{released}, #{super}"
  end

  def update(params)
    super

    @amount = params[:genre] if params[:genre]
    @amount = params[:released] if params[:released]
  end
end
