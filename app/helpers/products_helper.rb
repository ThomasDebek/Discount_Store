# app/helpers/products_helper.rb
module ProductsHelper
  def render_product_image(product)
    puts "Rendering image for #{product.name}: #{product.image.attached?}" # Dodaj to
    if product.image.attached?
      image_tag product.image.variant(resize: '300x200') # Dostosuj rozmiar do swoich potrzeb
    else
      content_tag(:div, "No Image", class: "placeholder")
    end
  end
end
