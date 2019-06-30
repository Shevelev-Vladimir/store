# encoding: utf-8

# Класс-родитель Товар.
class Product
  attr_accessor :title, :autor, :price, :amount

  # Конструктор товара записывает, сколько стоит товар и сколько осталось
  def initialize(params)
    @title = params[:title]
    @autor = params[:autor]
    @price = params[:price]
    @amount = params[:amount]
  end

  def to_s
    "#{@price} руб. (осталось #{@amount})"
  end

  # Обновляем параметры, если эти ключи были переданы в ассоциативном массиве.
  def update(params)
    @amount = params[:title] if params[:title]
    @amount = params[:autor] if params[:autor]
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  def from_file
    error = "NotImplementedError"
    puts error
  end
end
