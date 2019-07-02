# encoding: utf-8

# Программа "Магазин книг и фильмов".
# Вывод версии программы.
VERSION = 0.5
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
require_relative 'lib/product_collection'

begin
  # Считываем наши книгу и фильм из папок data/books и data/films соответственно
  parh_data = "#{__dir__}/data"
  product_collection = ProductCollection.from_dir(parh_data)
  # film = Film.from_file(parh_data + '/films/00.txt')
  # book = Book.from_file(parh_data + '/books/00.txt')

  product_collection.sort!(by: :price, order: :asc)

  puts "Вот какие товары у нас есть:\n\n"
  product_collection.to_a.each do |product|
    puts product
  end

#Ловим ошибки.
rescue NotImplementedError
  puts 'Метод класса Product.from_file не реализован'
end
