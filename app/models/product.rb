class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  paginates_per 10

  field :code, type: String
  field :barcode, type: String
  field :url, type: String
  field :product_name, type: String
  field :quantity, type: String
  field :categories, type: String
  field :packaging, type: String
  field :brands, type: String
  field :image_url, type: String
  field :status, type: String, default: 'draft'
  field :imported_t, type: DateTime

  validates :code, presence: true, uniqueness: true
  validates :product_name, presence: true
  validates :status, inclusion: { in: %w[draft imported] }

  scope :unsynced, -> { where(status: 'draft') }
  scope :synced, -> { where(status: 'imported') }

  after_save :mark_as_imported

  def mark_as_imported
    update(status: :imported) if self.draft?
  end
  #Ex:- :default =>''


  def self.sync
    unsynced.each do |product|
      product.sync
    end
  end

  def sync
    return unless draft?

    update!(status: 'imported', imported_t: Time.now.utc)
  end

  def draft?
    status == 'draft'
  end

  def imported?
    status == 'imported'
  end
end
