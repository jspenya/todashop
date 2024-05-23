# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  image_link      :string
#  is_bidding      :boolean          default(FALSE)
#  name            :string
#  price           :decimal(8, 2)
#  sub_description :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  game_id         :bigint           not null
#
# Indexes
#
#  index_products_on_game_id  (game_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#
class Product < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :game
  has_one_attached :qrcode, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :bids, dependent: :destroy

  after_commit :generate_qrcode, on: :create

  scope :bidding, -> { where(is_bidding: true)}
  scope :not_bidding, -> { where(is_bidding: false)}
  # Ex:- scope :active, -> {where(:active => true)}

  private

  def generate_qrcode
    # Get the host
    # host = Rails.application.routes.default_url_options[:host]
    host = Rails.application.config.action_controller.default_url_options[:host]

    # Create the QR code object
    # qrcode = RQRCode::QRCode.new("http://#{host}/products/#{id}")
    qrcode = RQRCode::QRCode.new(pay_url(host:))

    # Create a new PNG object
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120,
    )

    # Attach the QR code to the active storage
    self.qrcode.attach(
      io: StringIO.new(png.to_s),
      filename: "qrcode.png",
      content_type: "image/png",
    )
  end
end
