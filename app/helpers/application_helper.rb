module ApplicationHelper
  def price_total_cart product, quantity
    number = product.new_price.to_i * quantity.to_i
    number_to_currency(number, separator: ",", delimiter: ".")
  end

  def number_format number
    number_to_currency(number, separator: ",", delimiter: ".")
  end

  def total_cart products
    total = 0
    products.each do |product,quantity|
      total += product.new_price * quantity
    end
    total
  end

  def gravatar_for product
    if product.images.first.nil?
      image_tag "https://qph.fs.quoracdn.net/main-qimg-680c8f445130201b7b1850e7d02d76dd-c",
        alt: product.name
    else
      image_tag product.images.first.image_url, alt: product.name
    end
  end

  def load_user_images comment
    if comment.image.blank?
      image = "https://png.icons8.com/dotty/2x/administrator-male.png"
    else
      image = comment.image
    end
    image_tag image
  end

  def full_title page_title = ""
    base_title = t "base_title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
