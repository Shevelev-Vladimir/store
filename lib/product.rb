# encoding: utf-8

# Класс-родитель Товар.
class Product
  attr_reader :price, :amount

  # Конструктор товара записывает, сколько стоит товар и сколько осталось
  def initialize(params)
    @title = params[:title]
    @price = params[:price]
    @amount = params[:amount]
    @autor = params[:autor]
    @genre = params[:genre]
    @released = params[:released]
  end

  def to_s
    "#{@price} руб. (осталось #{@amount})"
  end
end
