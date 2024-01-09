class SearchProduct
  def call(phrase)
    Product.search_by_name(phrase)
  end
end