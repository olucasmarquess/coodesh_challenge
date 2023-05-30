class ApplicationController < ActionController::API
  before_action :authenticate_with_api_key

  private

  def authenticate_with_api_key
    api_key = request.headers['API-KEY']
    user = User.find_by(api_key: api_key)
    head :unauthorized unless user
  end
end
