module FunctionHelper
  def gravatar_for product, options = {size: 80}
    gravatar_id = Digest::MD5::hexdigest product.images.downcase
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    if gravatar_url.nil?
      gravatar_url = gravatar_url
    else
      gravatar_url = "/assets/products/small/products-01-c52154489e6a6ed4d74b80a4bd1ba9718162ad8b3dba85943461d667282ee4df.png"
    end
    image_tag(gravatar_url, alt: product.images, class: "gravatar")
  end
end
