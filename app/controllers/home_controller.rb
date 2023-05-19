class HomeController < ApplicationController
  def index
    render json: { message: 'Fullstack Challenge 20201026' }, status: :ok
  end
end
