# encoding: utf-8

# Программа "Магазин книг и фильмов". Версия 1.0.
# Вывод версии программы.
VERSION = 1.0
puts  "Программа \"Магазин книг и фильмов\". Версия #{VERSION}.\n\n"

# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем классы товара и классов-детей: книги и фильма
require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disc'

shop = []

shop << leon = Film.new(
  title: 'Леон', released: 1994, autor: 'Люк Бессон', price: 990, amount: 5
)

shop << durak = Film.new(
  title: 'Дурак', released: 2014, autor: 'Юрий Быков', price: 390, amount: 1
)

shop << idiot = Book.new(
  title: 'Идиот',
  autor: 'Федор Достоевский',
  price: 1500,
  amount: 10,
  genre: 'роман')

puts "Вот какие товары у нас есть:\n\n"
shop.each { |item| puts item }
