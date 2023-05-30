class User
  include Mongoid::Document
  # Callbacks
  before_create :generate_api_key

  ## Database authenticatable
  field :name,               type: String, default: ""
  field :email,              type: String, default: ""
  field :password,           type: String, default: ""
  field :api_key,            type: String, default: ""

  ## Validatable
  validates :api_key, presence: true
  include Mongoid::Timestamps

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end
end
