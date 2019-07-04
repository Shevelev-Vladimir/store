# encoding: utf-8

# Класс-родитель Товар.
class Product
  attr_accessor :title, :autor, :price, :amount

  # Конструктор товара записывает, сколько стоит товар и сколько осталось
  def initialize(params)
    @title = params[:title]
    @autor = params[:autor]
    @price = params[:price].to_i
    @amount = params[:amount].to_i
  end

  # Вывод информации в заданном формате.
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

  # Абстрактный метод, призванный для считывания информации из файла.
  def self.from_file(path)
    raise "NotImplementedError"
  end
end
