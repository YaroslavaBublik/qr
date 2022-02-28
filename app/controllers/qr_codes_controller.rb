# frozen_string_literal: true

class QrCodesController < ApplicationController
  def new; end

  def create
    qrcode = RQRCode::QRCode.new(link)

    @name = name

    png = qrcode.as_png(
      bit_depth:         1,
      border_modules:    4,
      color_mode:        ChunkyPNG::COLOR_GRAYSCALE,
      color:             'black',
      file:              "app/assets/images/qr_codes/#{name}.png",
      fill:              'white',
      module_px_size:    6,
      resize_exactly_to: false,
      resize_gte_to:     false,
      size:              240
    )
    File.binwrite("app/assets/images/qr_codes/#{name}.png", png.to_s)
    send_pdf
  end

  private

  def send_pdf
    file = File.read("app/assets/images/qr_codes/#{@name}.png")

    send_data file, filename: "#{@name}.png"
  end

  def name
    params[:qr_code][:name]
  end

  def link
    params[:qr_code][:link]
  end
end
