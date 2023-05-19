require 'nokogiri'
require 'mechanize'
require 'json'
require 'net/http'

class ScrapingJob < ApplicationJob
  queue_as :default

  def perform
    agent = Mechanize.new
    page = agent.get('https://world.openfoodfacts.org/')
    product_links = page.search('.products a').first(100)

    product_links.each do |link|
      product_page = agent.click(link)
      code = product_page.at('#barcode')&.content&.strip
      next if code.nil? || Product.where(code: code).exists?

      image_url = fetch_product_image_url(code)
      next if image_url.nil?

      save_product_info(product_page, image_url)
    end
  end

  private

  def fetch_product_image_url(code)
    url = "https://world.openfoodfacts.org/api/v0/product/#{code}.json"
    response = Net::HTTP.get(URI(url))
    json_data = JSON.parse(response)
    image_url = json_data.dig('product', 'image_front_url')

    image_url
  end

  def save_product_info(page, image_url)
    product = Product.new(
      product_name: page.at('title')&.content&.strip,
      code: page.at('#barcode')&.content&.strip,
      barcode: page.at('#barcode_paragraph')&.content&.strip,
      url: page.uri.to_s,
      quantity: page.at('#field_quantity_value')&.text&.strip,
      categories: page.at('#field_categories_value')&.content&.strip,
      packaging: page.at('#field_packaging_value')&.text&.strip,
      brands: page.at('#field_brands_value')&.text&.strip,
      image_url: image_url,
      imported_t: Time.now.utc,
      status: 'draft'
    )
    product.save
  end
end
