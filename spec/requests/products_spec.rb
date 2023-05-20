# spec/requests/products_spec.rb
require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "returns a list of products" do
      # Cria alguns produtos para o teste
      create_list(:product, 3)

      # Faz a requisição GET para /products
      get "/products"

      # Verifica se a resposta possui o status HTTP 200 OK
      expect(response).to have_http_status(200)

      # Verifica se o corpo da resposta contém a lista de produtos
      expect(response.body).to include_json([
        { id: be_present, name: "Product 1" },
        { id: be_present, name: "Product 2" },
        { id: be_present, name: "Product 3" }
      ])
    end
  end

  describe "GET /products/:id" do
    it "returns a single product" do
      # Cria um produto para o teste
      product = create(:product, name: "Test Product")

      # Faz a requisição GET para /products/:id
      get "/products/#{product.id}"

      # Verifica se a resposta possui o status HTTP 200 OK
      expect(response).to have_http_status(200)

      # Verifica se o corpo da resposta contém os dados do produto
      expect(response.body).to include_json({
        id: be_present,
        name: "Test Product"
      })
    end

    it "returns a 404 error for non-existent product" do
      # Faz a requisição GET para /products/:id com um ID inválido
      get "/products/12345"

      # Verifica se a resposta possui o status HTTP 404 Not Found
      expect(response).to have_http_status(404)
    end
  end
end
