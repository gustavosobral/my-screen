if Rails.env.test? || Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = true

    # Disable FFMPEG logger
    FFMPEG.logger = Logger.new(nil)
  end
end

if Rails.env.development?
  CarrierWave.configure do |config|
    config.asset_host = ENV['ASSET_HOST']
  end
end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['S3_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
  end
end
