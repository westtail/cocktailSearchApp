# CarrierWaveの設定呼び出し
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|
  config.fog_public = false
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'cocktailsearch'
  #config.asset_host = 'https://s3.amazonaws.com/cocktailsearch'
  config.asset_host = 'https://cocktailsearch.s3.amazonaws.com'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
    aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key] ,
    region: 'ap-northeast-1'
  }
end