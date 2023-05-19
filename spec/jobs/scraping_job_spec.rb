require 'rails_helper'

RSpec.describe ScrapingJob, type: :job do
  describe "#perform" do
    let(:agent) { Mechanize.new }

    it "saves the products in the database" do
      allow(agent).to receive(:get).and_return(dummy_page)
      allow(agent).to receive(:click).with(dummy_link)

      job = ScrapingJob.new

      expect {
        job.perform_now
      }.to change(Product, :count).by(10)

      product = Product.last
      expect(product.product_name).to eq("Test Product")
      expect(product.code).to eq("12345")
    end

    def dummy_page
      Nokogiri::HTML("<html><head></head><body><a href='http://example.com'>Link</a></body></html>")
    end

    def dummy_link
      dummy_page.at("a")
    end
  end
end
