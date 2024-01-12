class ProductPresenter
  def initialize(product)
    @product = product
  end

  def full_title
    @product.name + " " + "in my Shoop "
  end

end