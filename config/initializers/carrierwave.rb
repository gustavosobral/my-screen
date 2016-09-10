if Rails.env.test? || Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = true

    # Disable FFMPEG logger
    FFMPEG.logger = Logger.new(nil)
  end
end
