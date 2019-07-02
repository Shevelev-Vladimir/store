class ProductCollection
  # Константа с хэшем (ключ - имя папки, значение - ещё один хэш (ключ - /
  # название папки, значение - ссылка на соответствующий класс)).
  PRODUCT_TYPES = {
    film: {dir: 'films', class: Film},
    book: {dir: 'books', class: Book}
  }

  def initialize(products = [])
    @products = products
  end

  # Считывает продукты из папки data.
  def self.from_dir(path_dir)
    products = []

    PRODUCT_TYPES.each do |type, hash|
      # Получим из хэша путь к директории с файлами нужного типа.
      product_dir = hash[:dir]

      # Получим из хэша объект нужного класса.
      product_class = hash[:class]

      # Передаем путь к файлу в метод класса from_file
      Dir["#{path_dir}/#{product_dir}/*.txt"].each do |path|
        products << product_class.from_file(path)
      end
    end

    self.new(products)
  end

  # Возвращает массив товаров.
  def to_a
    @products
  end

  # Сортирует товары по цене, остатку на складе или по названию /
  # (как по возрастанию, так и по убыванию)
   def sort!(params)
    # Делает выбор по параметру by
    case params[:by]
    when :title
      # Если запросили сортировку по наименованию
      @products.sort_by! { |product| product.to_s }
    when :price
      # Если запросили сортировку по цене
      @products.sort_by! { |product| product.price }
    when :amount
      # Если запросили сортировку по количеству
      @products.sort_by! { |product| product.amount }
    end

    # Если запросили сортировку по возрастанию
    @products.reverse! if params[:order] == :asc

    # Возвращаем ссылку на экземпляр, чтобы у него по цепочке можно было вызвать
    # другие методы.
    self
  end
end
