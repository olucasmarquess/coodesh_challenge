require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #show" do
    it "assigns the requested product to @product" do
      product = FactoryBot.create(:product, code: "12345")
      get :show, params: { code: "12345" }
      expect(assigns(:product)).to eq(product)
    end

    it "renders the show template" do
      FactoryBot.create(:product, code: "12345")
      get :show, params: { code: "12345" }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #index" do
    it "assigns the paginated products to @products" do
      products = FactoryBot.create_list(:product, 20)
      get :index, params: { page: 1 }
      expect(assigns(:products)).to eq(products[0..9])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #sync" do
    it "triggers the ScrapingJob" do
      expect(ScrapingJob).to receive(:perform_now)
      get :sync
    end

    it "redirects to the root path with a notice" do
      get :sync
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('Synchronization successful!')
    end
  end
end
