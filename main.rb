# encoding: utf-8

# Программа "Магазин книг и фильмов".
# Вывод версии программы.
VERSION = 1.0
puts  "Программа \"Магазин книг и фильмов\". Версия #{VERSION}."

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
  parh_data = "#{__dir__}/data"
  product_collection = ProductCollection.from_dir(parh_data)

  # Сортируем по цене.
  product_collection.sort!(by: :price, order: :asc)

  # Создаём продуктовую корзину.
  basket = ProductCollection.new

  loop do
    puts "\nЧто хотите купить:\n\n"

    puts product_collection.put_to_sale

    puts "0. Выход\n"

    user_input = STDIN.gets.to_i

    # Условия выхода из цикла.
    break if user_input == 0
    # Запуск цикла сначала, если пользователь выбрал товар с остатком < 1.
    redo unless product_collection.include?(user_input)

    user_choise = product_collection.to_a[user_input - 1]

    # Уменьшаем количество оставшихся продуктов.
    user_choise.amount -= 1

    puts "\nВы выбрали: #{user_choise}"

    # Добавляем выбранный товар в корзину.
    basket.add_to_purchase(user_choise)

    puts "\nВсего товаров на сумму: #{basket.price_all}\n"
  end

  system('cls') || system('clear')

  puts "Вы купили: \n\n#{basket.to_s}"

  puts "\nС Вас — #{basket.price_all} руб. Спасибо за покупки!"

#Ловим ошибки.
rescue NotImplementedError
  puts 'Метод класса Product.from_file не реализован.'
rescue  Interrupt
  puts "\nВы завершили программу."
end
