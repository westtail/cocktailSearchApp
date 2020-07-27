class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  #上限変更
  process :resize_to_limit => [300, 300]

  #JPGで保存
  process :convert => 'jpg'

  #サムネイルを生成
  version :thumb do
    process :resize_to_limit => [300, 300]
  end

  # jpg,jpeg,gif,pngのみ
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  #ファイル名を変更し拡張子を同じにする
  def filename
    super.chomp(File.extname(super)) + '.jpg' 
  end

#日付で保存
  def filename
    if original_filename.present?
      time = Time.now
      name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
      name.downcase
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
