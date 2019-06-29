# encoding: utf-8

# Программа "Магазин книг и фильмов". Версия 1.0.
# Вывод версии программы.
def print_version(version)
  "Программа \"Магазин книг и фильмов\". Версия #{version}."
end

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


leon = Film.new(price: 990, amount: 5)



puts leon
